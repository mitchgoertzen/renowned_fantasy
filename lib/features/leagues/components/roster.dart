import 'dart:math';

import 'package:fantasy_draft/features/leagues/models/temp_fantasy_league.dart';
import 'package:fantasy_draft/features/leagues/models/temp_roster.dart';
import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/global_components/draggable_player_target.dart';
import 'package:fantasy_draft/global_components/draggable_player.dart';
import 'package:fantasy_draft/managers/player_drag_manager.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_draft/utils/position_converter.dart';

class Roster extends StatefulWidget {
  const Roster(
      {super.key,
      required this.updateRoster,
      required this.roster,
      required this.removePlayerFromExtra,
      required this.reassignDisplacedPlayer,
      required this.dragManager,
      required this.recentPlayerAccepted,
      required this.extraPlayers});

  //TODO: rename functions
  final Function(Roster? r) updateRoster;
  final Function(Player? p) removePlayerFromExtra;
  final Function(Player? p, String? o) reassignDisplacedPlayer;
  final Function(bool? b) recentPlayerAccepted;
  //        pos, players
  final Map<int, List<Player>> roster;
  final List<Player> extraPlayers;

  final PlayerDragManager dragManager;

  @override
  State<Roster> createState() => _RosterState();

  Map<int, List<Player>> getRoster() {
    return roster;
  }
}

class _RosterState extends State<Roster> {
  Player emptyPlayer = TempFantasyLeague.emptyPlayer;

  int pos = -1;
  double dragOpacity = 1;

  bool recentPlayerAccepted = false;

  // void updatePlayerDrag(){
  //   print('player drag has been updated');
  //   //TODO: check player positions match slot positions
  //   setState(() {
  //     //           not dragged       dragged
  //    false ? dragOpacity = 1 : dragOpacity = 5; //HERE

  //   });
  // }

  void acceptPlayer(bool b) {
    print('player accepted is $b');
    widget.recentPlayerAccepted(b);
    recentPlayerAccepted = b;
  }

  void clearPreviousSlot() {
    print('saved:');
    if (recentPlayerAccepted) {
      TempRoster.savedRoster.forEach((key, value) {
        for (var p in value) {
          print('${p.first} ${p.last}');
        }
      });
      print('accepted');
    } else {
      print('not accepted');
    }
  }

  void confirmPlayerInTarget(
      Player newPlayer, int targetPosition, int playerSlotIndex) {
    print('roster player has been dropped into target');

    //find the previous slot the new player was occupying
    String newPlayerOrigin = findPreviousPlayerSlot(newPlayer, playerSlotIndex);

    widget.removePlayerFromExtra(newPlayer);

    if (widget.roster[targetPosition]![playerSlotIndex].first != '' &&
        widget.roster[targetPosition]![playerSlotIndex].id != newPlayer.id) {
      //target has a current player
      print('target is not empty');
      reassignDisplacedPlayer(
          widget.roster[targetPosition]![playerSlotIndex], newPlayerOrigin);
    }

    setState(() {
      widget.roster[targetPosition]![playerSlotIndex] = newPlayer;
    });

    //if player was taken from extras list, remove player

    widget.updateRoster(widget);
  }

  bool playerPositionEligible(List<String> positions, int targetPosition) {
    if (positions
        .contains(PositionConverter.positionIntToString(targetPosition))) {
      return true;
    }
    return false;
  }

  String findPreviousPlayerSlot(Player p, int index) {
    //was new player accepted into position slot
    if (recentPlayerAccepted) {
      List<int> positionIndices = [];
      for (String pos in p.positions) {
        if (pos != 'x') {
          positionIndices.add(PositionConverter.positionStringToInt(pos));
        }
      }
      positionIndices.add(8);

      for (int z in positionIndices) {
        for (int i = 0; i < widget.roster[z]!.length; i++) {
          if (widget.roster[z]![i].id == p.id) {
            widget.roster[z]?[i] = emptyPlayer;
            return 'Roster';
          }
        }
      }
    }
    return '';
  }

  //when a player is displaced from its current slot, check if there are vacant slots to fill
  void reassignDisplacedPlayer(Player p, String newPlayerOrigin) {
    //check slot for each of player's positions
    for (String pos in p.positions) {
      if (pos != 'x') {
        for (int i = 0;
            i <
                widget
                    .roster[PositionConverter.positionStringToInt(pos)]!.length;
            i++) {
          if (widget.roster[PositionConverter.positionStringToInt(pos)]?[i]
                  .first ==
              '') {
            //other slot is available
            setState(() {
              widget.roster[PositionConverter.positionStringToInt(pos)]?[i] = p;
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

  @override
  Widget build(BuildContext context) {
    //TODO: add daily/weekly/season stats?
    //TODO: toggle(swipe will interfere with tabs) between Batters/Pitchers
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 2; i < widget.roster.entries.length - 1; i++)
          for (int j = 0; j < widget.roster[i]!.length; j++)
            ListenableBuilder(
              listenable: widget.dragManager,
              builder: (BuildContext context, Widget? child) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    width: 300,
                    child: DraggableItemTarget(
                      position: i,
                      positionIndex: j,
                      checkPlayerAccepted: (Player? p, int? t, int? i) =>
                          confirmPlayerInTarget(p!, t!, i!),
                      positionEligibility: (List<String>? l, int? t) =>
                          playerPositionEligible(l!, t!),
                      playerDragged: false, //HERE
                      acceptPlayer: (bool? b) => acceptPlayer(b!),
                      child: SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SizedBox(
                                    width: 20,
                                    child: Text(
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(
                                                min(1, 1 / opacityCheck(i)))),
                                        textAlign: TextAlign.center,
                                        PositionConverter.positionIntToString(
                                            i)),
                                  ),
                                ),
                                Expanded(
                                  child: DraggablePlayer(
                                    player: widget.roster[i]![j],
                                    dragManager: widget.dragManager,
                                    // updatePlayerDrag: () => updatePlayerDrag(),
                                    opac: opacityCheck(i),
                                    clearPreviousSlot: (String? s) => clearPreviousSlot,
                                    location: 'Roster',
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                );
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
                              clearPreviousSlot: (String? s) => clearPreviousSlot,
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
