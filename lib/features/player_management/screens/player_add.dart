import 'dart:ffi';

import 'package:fantasy_draft/features/leagues/models/temp_roster.dart';
import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/global_components/draggable_player.dart';
import 'package:fantasy_draft/global_components/roster.dart';
import 'package:fantasy_draft/global_components/section_container.dart';
import 'package:fantasy_draft/managers/player_drag_manager.dart';
import 'package:flutter/material.dart';

class PlayerAdd extends StatefulWidget {

  const PlayerAdd({super.key, required this.playerToAdd});

  final Player playerToAdd;


  
  @override
  State<StatefulWidget> createState() => _PlayerAddState();
}

class _PlayerAddState extends State<PlayerAdd>{



  late PlayerDragManager dragManager;
  late Roster myRoster;

  _PlayerAddState(){
    dragManager = PlayerDragManager();

      myRoster = Roster(
      updateRoster: (Roster? r) => updateRoster(r!),
      roster: TempRoster.getRoster(),
      teamRemove: (String? s, Player? p) => Void,
      teamAdd: (Player? p) => Void,
      dragManager: dragManager
    );
  }


    void updateRoster(Roster r) {
    print('team callback');
    setState(() {
      myRoster = r;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
            Center(child: sectionContainer(myRoster)),
            Center(
              child: sectionContainer(Column(children: [
                Text('Player to Add:'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [DraggablePlayer(player: widget.playerToAdd, opac: 1, dragManager: dragManager)]
                )
              ],))),
          ],
        );
  }

}
