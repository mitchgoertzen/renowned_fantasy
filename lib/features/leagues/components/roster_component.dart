import 'package:fantasy_draft/global_components/draggable_player.dart';
import 'package:fantasy_draft/managers/player_drag_manager.dart';
import 'package:fantasy_draft/models/Player.dart';
import 'package:fantasy_draft/utils/amplify_utilities.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_draft/utils/position_converter.dart';

class RosterComponent extends StatefulWidget {
  const RosterComponent(
      {super.key,
      required this.updateRoster,
      required this.rosterPlayers,
      required this.removePlayerFromExtra,
      required this.reassignDisplacedPlayer,
      required this.dragManager,
      required this.recentPlayerAccepted,
      required this.extraPlayers});

  //TODO: rename functions
  final Function(RosterComponent? r) updateRoster;
  final Function(String? p) removePlayerFromExtra;
  final Function(String? p, String? o) reassignDisplacedPlayer;
  final Function(bool? b) recentPlayerAccepted;

  //        pos, players
  final Map<int, List<String>> rosterPlayers;

  final List<String> extraPlayers;

  final PlayerDragManager dragManager;

  @override
  State<RosterComponent> createState() => _RosterComponentState();

  Map<int, List<String>> getRosterPlayers() {
    return rosterPlayers;
  }
}

class _RosterComponentState extends State<RosterComponent> {
  bool recentPlayerAccepted = false;
  double dragOpacity = 1;
  int pos = -1;

  void acceptPlayer(bool b) {
    print('player accepted is $b');
    widget.recentPlayerAccepted(b);
    recentPlayerAccepted = b;
  }

  void clearPreviousSlot() {
    print('saved:');
    if (recentPlayerAccepted) {
      // TempRoster.savedRoster.forEach((key, value) {
      //   for (var p in value) {
      //     print('${p.first} ${p.last}');
      //   }
      // });
      print('accepted');
    } else {
      print('not accepted');
    }
  }

  Future<void> confirmPlayerInTarget(
      String newPlayer, int targetPosition, int playerSlotIndex) async {
    print('roster player has been dropped into target');

    //find the previous slot the new player was occupying
    String newPlayerOrigin = findPreviousPlayerSlot(newPlayer, playerSlotIndex);

    widget.removePlayerFromExtra(newPlayer);

    //get player from roster at targetPosition
    Player existingPlayer = await AmplifyUtilities.getPlayer(
        widget.rosterPlayers[targetPosition]![playerSlotIndex]);

    if (existingPlayer.First != '' && existingPlayer.id != newPlayer) {
      //target has a current player
      print('target is not empty');
      reassignDisplacedPlayer(existingPlayer.id, newPlayerOrigin);
    }

    //update local
    setState(() {
      widget.rosterPlayers[targetPosition]![playerSlotIndex] = newPlayer;
    });

    //if player was taken from extras list, remove player

    //update db
    widget.updateRoster(widget);
  }

  bool playerPositionEligible(List<String> positions, int targetPosition) {
    if (positions
        .contains(PositionConverter.positionIntToString(targetPosition))) {
      return true;
    }
    return false;
  }

  String findPreviousPlayerSlot(String p, int index) {
    //was new player accepted into position slot
    if (recentPlayerAccepted) {
      List<int> positionIndices = [];
      List<String> positions = [];
      //TODO: get player p's position list
      for (String pos in positions) {
        if (pos != 'x') {
          positionIndices.add(PositionConverter.positionStringToInt(pos));
        }
      }
      positionIndices.add(8);

      for (int z in positionIndices) {
        for (int i = 0; i < widget.rosterPlayers[z]!.length; i++) {
          if (widget.rosterPlayers[z]![i] == p) {
            widget.rosterPlayers[z]?[i] = '';
            return 'Roster';
          }
        }
      }
    }
    return '';
  }

  //when a player is displaced from its current slot, check if there are vacant slots to fill
  void reassignDisplacedPlayer(String p, String newPlayerOrigin) {
    //check slot for each of player's positions
    List<String> positions = [];
    //TODO: get player p's position list
    for (String pos in positions) {
      if (pos != 'x') {
        for (int i = 0;
            i <
                widget
                    .rosterPlayers[PositionConverter.positionStringToInt(pos)]!
                    .length;
            i++) {
          if (widget.rosterPlayers[PositionConverter.positionStringToInt(pos)]
                  ?[i] ==
              '') {
            //other slot is available

            //update db
            setState(() {
              widget.rosterPlayers[PositionConverter.positionStringToInt(pos)]
                  ?[i] = p;
            });
            return;
          }
        }
      }
    }
    //no vacant positon slots exist, displaced player will be moved to extras or drop list
    widget.reassignDisplacedPlayer(p, newPlayerOrigin);
  }

  double opacityCheck(int pos) {
    return (widget.dragManager.playerBeingDragged &&
            widget.dragManager.positions
                .contains(PositionConverter.positionIntToString(pos)))
        ? widget.dragManager.dragOpacity / 2
        : widget.dragManager.dragOpacity;
  }

//TODO: change to get player from db
  Future<String> callAsyncFetch() =>
      Future.delayed(Duration(seconds: 2), () => "hi");

  @override
  Widget build(BuildContext context) {
    //TODO: add daily/weekly/season stats?
    //TODO: toggle(swipe will interfere with tabs) between Batters/Pitchers
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 2; i < widget.rosterPlayers.entries.length - 1; i++)
          for (int j = 0; j < widget.rosterPlayers[i]!.length; j++)
            ListenableBuilder(
              listenable: widget.dragManager,
              builder: (BuildContext context, Widget? child) {
                return FutureBuilder<String>(
                    future: callAsyncFetch(),
                    builder: (context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!);
                      } else {
                        return CircularProgressIndicator();
                      }
                    }); //Padding(
                //   padding: const EdgeInsets.all(2.0),
                //   child: SizedBox(
                //     width: 300,
                //     child: DraggableItemTarget(
                //       '
                //|:?': i,
                //       positionIndex: j,
                //       checkPlayerAccepted: (Player? p, int? t, int? i) =>
                //           confirmPlayerInTarget(p!, t!, i!),
                //       positionEligibility: (List<String>? l, int? t) =>
                //           playerPositionEligible(l!, t!),
                //       playerDragged: false, //HERE
                //       acceptPlayer: (bool? b) => acceptPlayer(b!),
                //       child: SizedBox(
                //         height: 40,
                //         child: Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.all(4.0),
                //                   child: SizedBox(
                //                     width: 20,
                //                     child: Text(
                //                         style: TextStyle(
                //                             color: Colors.black.withOpacity(
                //                                 min(1, 1 / opacityCheck(i)))),
                //                         textAlign: TextAlign.center,
                //                         PositionConverter.positionIntToString(
                //                             i)),
                //                   ),
                //                 ),
                //                 Expanded(
                //                   child: DraggablePlayer(
                //                     player: widget.rosterPlayers[i]![
                //                         j], //TODO: getplayer(widget.rosterPlayers[i]![j])
                //                     dragManager: widget.dragManager,
                //                     // updatePlayerDrag: () => updatePlayerDrag(),
                //                     opac: opacityCheck(i),
                //                     clearPreviousSlot: (String? s) =>
                //                         clearPreviousSlot,
                //                     location: 'Roster',
                //                   ),
                //                 )
                //               ]),
                //         ),
                //       ),
                //     ),
                //   ),
                // );
              },
            ),
        Center(
            child: Column(
          children: [
            Text('Extra Players:'),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              for (var p in widget.extraPlayers)
                ListenableBuilder(
                    listenable: widget.dragManager,
                    builder: (BuildContext context, Widget? child) {
                      return SizedBox(
                        height: 30,
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DraggablePlayer(
                              player: p,
                              dragManager: widget.dragManager,
                              // updatePlayerDrag: () => updatePlayerDrag(),
                              opac: opacityCheck(1),
                              clearPreviousSlot: (String? s) =>
                                  clearPreviousSlot,
                              location: 'Roster',
                            )),
                      );
                    })
            ])
          ],
        )),
      ],
    );
  }
}
