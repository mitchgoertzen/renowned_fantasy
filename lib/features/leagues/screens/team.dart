import 'package:fantasy_draft/features/leagues/models/temp_roster.dart';
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
 // late Map<int, List<Player>> currentRoster;

  TempRoster temp = TempRoster();

  late Roster myRoster;

  late PlayerDragManager dragManager;

  List<PlayerItem> playerList = [];

  List<Widget> morePlayers = [];

  //List<int, List<Player>> currentRoster;

  _TeamState() {

   // List<Player> initRoster = TempRoster.getRoster();

    //currentRoster[0] =  {0, initRoster[0]} as Map<int, Player>;

    // for(int i = 2; i < initRoster.length; i++){
    //    currentRoster[i] = initRoster[i - 2];
    // }

 //   currentRoster= temp.getRoster();

    //   print(currentRoster.length);


    // for(var entry in currentRoster.entries){
    //   print(entry.value.length);
    // }


    dragManager = PlayerDragManager();

    myRoster = Roster(
      updateRoster: (Roster? r) => updateRoster(r!),
      roster: TempRoster.getRoster(),
      teamRemove: (String? s, Player? p) => removePlayer(s!, p!),
      teamAdd: (Player? p) => addPlayer(p!),
      dragManager: dragManager
    );

    playerList = TempRoster.getRoster()[8]!.map((i) => PlayerItem(i, dragManager)).toList();

    for (var p in playerList) {
      morePlayers.add(p.getWidget());
    }


  }

  void updateRoster(Roster r) {
    print('team callback');
    TempRoster.updateRoster(myRoster.getRoster());
    setState(() {
      myRoster = r;
    });
  }

//if player is already in target --> move that player to playerList
  void removePlayer(String id, Player p) {
    print('REMOVE PLAYER');
    TempRoster.removeFromBench(p);
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
    TempRoster.addToBench(p);
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
