import 'dart:math';

import 'package:fantasy_draft/features/leagues/models/temp_available_players.dart';
import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/features/player_management/screens/player_add.dart';
import 'package:fantasy_draft/global_components/section_container.dart';
import 'package:fantasy_draft/utils/navigation_animation.dart';
import 'package:fantasy_draft/utils/utilities.dart';
import 'package:flutter/material.dart';

class SportsLeaguePage extends StatefulWidget {
  final VoidCallback pop;

  const SportsLeaguePage({super.key, required this.pop});

  @override
  State<SportsLeaguePage> createState() => _SportsLeaguePageState();
}

class _SportsLeaguePageState extends State<SportsLeaguePage> {
  List<Widget> morePlayers = [];

  @override
  void initState() {
    super.initState();

    morePlayers = generateLeaguePlayers(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
            child: sectionContainer(Column(
          children: [
            Text('Available Players:'),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: morePlayers)
          ],
        ))),
      ],
    );
  }

  List<Widget> generateLeaguePlayers(BuildContext context) {
    List<Widget> players = [];

    players = TempAvailPlayers.getAvailPlayers()
        .map((i) => LeaguePlayer(
                i,
                () => setState(() {
                      morePlayers = generateLeaguePlayers(context);
                      //morePlayers = [];
                      // generateLeaguePlayers(context);
                    }),
                widget.pop)
            .getWidget(context))
        .toList();

    // for (var p in playerList) {
    //   morePlayers.add(p.getWidget(context));
    // }

    return players;
  }
}

class LeaguePlayer {
  late final String playerID;
  late final Player player;
  late VoidCallback callback;
  late VoidCallback pop;

  LeaguePlayer(this.player, this.callback, this.pop) {
    playerID = player.last.hashCode.toString();
  }

  String getID() {
    return playerID;
  }

  double dragOpacity = 1;

  Padding getWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 20,
          color: Colors.white,
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(
                    style: TextStyle(
                        color: Colors.black.withOpacity(min(1, 1 / 1))),
                    playerInfoStringBuilder(player)),
                ElevatedButton(
                    onPressed: () {
                      print('asasasas');

                      Navigator.of(context)
                          .push(
                            NavigationAnimation.createRoute(PlayerAdd(
                                playerToBeAdded: [player],
                                closePlayerAdd: () =>
                                    {print(' close'), pop()})),
                          )
                          .then((_) => callback());

                      //  Navigator.of(context).push(

                      // );
                    },
                    child: Icon(Icons.add))
              ])),
        ));
  }
}
