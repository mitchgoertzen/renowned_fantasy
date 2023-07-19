import 'dart:math';

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
      required this.teamRemove,
      required this.teamAdd,
      required this.dragManager});

  //TODO: rename functions
  final Function(Roster? r) updateRoster;
  final Function(String? s, Player? p) teamRemove;
  final Function(Player? p) teamAdd;
  //        pos, players
  final Map<int, List<Player>> roster;

  final PlayerDragManager dragManager;

  @override
  State<Roster> createState() => _RosterState();


    Map<int, List<Player>> getRoster(){
    return roster;
  }
}

class _RosterState extends State<Roster> {
  Player emptyPlayer = Player('', '', ['']);

  int pos = -1;
  double dragOpacity = 1;

  // void updatePlayerDrag(){
  //   print('player drag has been updated');
  //   //TODO: check player positions match slot positions
  //   setState(() {
  //     //           not dragged       dragged
  //    false ? dragOpacity = 1 : dragOpacity = 5; //HERE

  //   });
  // }

  void callback(Player newPlayer, int targetPosition, int index) {
    print('roster callback');

    //player is eligble for position slot
    //newPlayer is player being dragged
    //if newPlayer has targetPosition listed -> begin checks
    if (newPlayer.positions
        .contains(PositionConverter.positionIntToString(targetPosition))) {
      //find the slot that this player was previously in
      findPreviousPlayerSlot(newPlayer, index);

      print('target: $targetPosition');
      print('index: $index');
      print('new player ${newPlayer.id}');
      print(widget.roster[targetPosition]);
      print(widget.roster[targetPosition]![index].first);
      print(widget.roster[targetPosition]![index].id);

      if (widget.roster[targetPosition]![index].first != '' &&
          widget.roster[targetPosition]![index].id != newPlayer.id) {

        //target has a current player
        print('target is not empty');
        checkForAvailablePosition(widget.roster[targetPosition]![index]);
      }

      setState(() {
        widget.roster[targetPosition]![index] = newPlayer;
      });

      widget.teamRemove(newPlayer.last.hashCode.toString(), newPlayer);
      widget.updateRoster(widget);
    }
  }

  bool playerPositionEligible(List<String> positions, int targetPosition) {
    if (positions
        .contains(PositionConverter.positionIntToString(targetPosition))) {
      return true;
    }
    return false;
  }

  void findPreviousPlayerSlot(Player p, int index) {
    for (String pos in p.positions) {
      if (pos != 'x') {
        int z = PositionConverter.positionStringToInt(pos);
        //check player roster slots, remove new player from current slot
        print('current position to check: ${PositionConverter.positionStringToInt(pos)}');
        //p is player being dragged
        //widget... is player
        for (int i = 0; i < widget.roster[z]!.length; i++) {
          print('player in this slot: Player ${widget.roster[z]![i].last}');
          if (widget.roster[z]![i].id == p.id) {
            widget.roster[z]?[i] = emptyPlayer;

            return;
          }
        }
      }
    }
  }

  void checkForAvailablePosition(Player p) {
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
            //other position is available
            setState(() {
              widget.roster[PositionConverter.positionStringToInt(pos)]?[i] = p;
            });
            return;
          }
        }
      }
      //check availability of slots for each
    }
    widget.teamAdd(p);
  }

  double opacityCheck(
    int pos,
  ) {
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
                      callback: (Player? p, int? t, int? i) =>
                          callback(p!, t!, i!),
                      positionEligibility: (List<String>? l, int? t) =>
                          playerPositionEligible(l!, t!),
                      playerDragged: false, //HERE
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
      ],
    );
  }
}
