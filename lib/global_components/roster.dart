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
      required this.teamCallback,
      required this.roster,
      required this.teamRemove,
      required this.teamAdd,
      required this.dragManager});

  //TODO: rename functions
  final Function(Roster? r) teamCallback;
  final Function(String? s) teamRemove;
  final Function(Player? p) teamAdd;
  final Map<int, Player> roster;

  final PlayerDragManager dragManager;

  @override
  State<Roster> createState() => _RosterState();
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

  void callback(Player newPlayer, int targetPosition) {
    print('roster callback');

    //player is eligble for position slot
    if (newPlayer.positions
        .contains(PositionConverter.positionIntToString(targetPosition))) {
      checkForPlayerInSlot(newPlayer);

      if (widget.roster[targetPosition]?.first != '' &&
          widget.roster[targetPosition]?.id != newPlayer.id) {
        //target has a current player
        print('target is not empty');
        checkForAvailablePosition(widget.roster[targetPosition]!);
      }

      setState(() {
        widget.roster[targetPosition] = newPlayer;
      });

      widget.teamRemove(newPlayer.last.hashCode.toString());
      widget.teamCallback(widget);
    }
  }

  bool playerPositionEligible(List<String> positions, int targetPosition) {
    if (positions
        .contains(PositionConverter.positionIntToString(targetPosition))) {
      return true;
    }
    return false;
  }

  void checkForPlayerInSlot(Player p) {
    for (String pos in p.positions) {
      //check player roster slots, remove new player from current slot
      if (widget.roster[PositionConverter.positionStringToInt(pos)]?.id ==
          p.id) {
        widget.roster[PositionConverter.positionStringToInt(pos)] = emptyPlayer;
        return;
      }
    }
  }

  void checkForAvailablePosition(Player p) {
    for (String pos in p.positions) {
      print(pos);
      if (widget.roster[PositionConverter.positionStringToInt(pos)]?.first ==
          '') {
        //other position is available
        setState(() {
          widget.roster[PositionConverter.positionStringToInt(pos)] = p;
        });
        return;
      }
    }
    widget.teamAdd(p);
  }

  double opacityCheck(int pos, ){
    return (widget.dragManager.playerBeingDragged  && widget.dragManager.positions.contains(PositionConverter.positionIntToString(pos)))?
                                     widget.dragManager.dragOpacity / 2: widget.dragManager.dragOpacity;
  }

  @override
  Widget build(BuildContext context) {
    //TODO: add daily/weekly/season stats?
    //TODO: swipe between Batters/Pitchers
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var entry in widget.roster.entries)
          ListenableBuilder(
            listenable: widget.dragManager,
            builder: (BuildContext context, Widget? child) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  width: 300,
                  child: DraggableItemTarget(
                    position: entry.key,
                    callback: (Player? p, int? i) => callback(p!, i!),
                    positionEligibility: (List<String>? l, int? i) =>
                        playerPositionEligible(l!, i!),
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
                                      style: TextStyle(color: Colors.black.withOpacity(min(1, 1 / opacityCheck(entry.key)) )),
                                      textAlign: TextAlign.center,
                                      PositionConverter.positionIntToString(
                                          entry.key)),
                                ),
                              ),
                              Expanded(
                                child: DraggablePlayer(
                                    player: entry.value,
                                    dragManager: widget.dragManager,
                                    // updatePlayerDrag: () => updatePlayerDrag(),
                                     opac: opacityCheck(entry.key),
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
