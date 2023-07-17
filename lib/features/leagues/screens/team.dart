import 'dart:collection';

import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/global_components/player_listing_component.dart';
import 'package:fantasy_draft/global_components/roster.dart';
import 'package:fantasy_draft/global_components/section_container.dart';
import 'package:fantasy_draft/managers/player_drag_manager.dart';
import 'package:flutter/material.dart';

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  //intial roster
  Map<int, Player> currentRoster = HashMap();

  late Roster myRoster;

  late PlayerDragManager dragManager;

  List<Player> newPlayers = [];

  List<Player> initialPlayers = [];

  List<PlayerItem> playerList = [];

  List<Widget> morePlayers = [];

  _TeamState() {
    newPlayers.add(Player('Player', '1', ['C', 'OF']));
    newPlayers.add(Player('Player', '2', ['2B', 'SS']));
    newPlayers.add(Player('Player', '3', ['OF']));
    newPlayers.add(Player('Player', '4', ['3B', 'OF']));
    newPlayers.add(Player('Player', '5', ['SP', 'RP']));
    newPlayers.add(Player('Player', '6', ['SP', 'RP']));

    initialPlayers.add(Player('', '', ['']));
    initialPlayers.add(Player('', '', ['']));
    initialPlayers.add(Player('', '', ['']));
    initialPlayers.add(Player('', '', ['']));
    initialPlayers.add(Player('', '', ['']));
    initialPlayers.add(Player('', '', ['']));
    initialPlayers.add(Player('', '', ['']));
    initialPlayers.add(Player('', '', ['']));

    currentRoster[2] = initialPlayers[0];
    currentRoster[3] = initialPlayers[1];
    currentRoster[4] = initialPlayers[2];
    currentRoster[5] = initialPlayers[3];
    currentRoster[6] = initialPlayers[4];
    currentRoster[7] = initialPlayers[5];
    currentRoster[1] = initialPlayers[6];
    currentRoster[0] = initialPlayers[7];


    dragManager = PlayerDragManager();

    myRoster = Roster(
      teamCallback: (Roster? r) => updateRoster(r!),
      roster: currentRoster,
      teamRemove: (String? s) => removePlayer(s!),
      teamAdd: (Player? p) => addPlayer(p!),
      dragManager: dragManager
    );

    playerList = newPlayers.map((i) => PlayerItem(i, dragManager)).toList();

    for (var p in playerList) {
      morePlayers.add(p.getWidget());
    }

  }

  void updateRoster(Roster r) {
    print('team callback');
    setState(() {
      myRoster = r;
    });
  }

//if player is already in target --> move that player to playerList
  void removePlayer(String id) {
    print('REMOVE PLAYER');
    setState(() {
      playerList.removeWhere((element) => element.getID() == id);
      morePlayers.clear();

      for (var p in playerList) {
        morePlayers.add(p.getWidget());
      }
    });
  }

  void addPlayer(Player p) {
    print('ADD PLAYER');
    setState(() {
      playerList.add(PlayerItem(p, dragManager));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
            Center(child: sectionContainer(myRoster)),
            Center(
              child: sectionContainer(Column(children: [
                Text('Extra Players:'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: morePlayers
                )
              ],))),
          ],
        );
  }
}
