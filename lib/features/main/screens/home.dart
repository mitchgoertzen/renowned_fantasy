import 'package:fantasy_draft/features/leagues/models/temp_roster.dart';
import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:fantasy_draft/global_widgets/Card.dart';
import 'package:fantasy_draft/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var currentPlayer = appState.current;

    Player emptyPlayer = Player('', '', ['']);

    TempRoster.currentRoster[0] =
        List<Player>.filled(getPositionMax(0), emptyPlayer); //C
    TempRoster.currentRoster[1] =
        List<Player>.filled(getPositionMax(1), emptyPlayer); //1B
    TempRoster.currentRoster[2] =
        List<Player>.filled(getPositionMax(2), emptyPlayer); //2B
    TempRoster.currentRoster[3] =
        List<Player>.filled(getPositionMax(3), emptyPlayer); //3B
    TempRoster.currentRoster[4] =
        List<Player>.filled(getPositionMax(4), emptyPlayer); //SS
    TempRoster.currentRoster[5] =
        List<Player>.filled(getPositionMax(5), emptyPlayer); //OF
    TempRoster.currentRoster[6] =
        List<Player>.filled(getPositionMax(6), emptyPlayer); //OF
    TempRoster.currentRoster[7] =
        List<Player>.filled(getPositionMax(7), emptyPlayer); //OF
    TempRoster.currentRoster[8] = []; //EXTRAS

    TempRoster.currentRoster[2]![0] = Player('Player', '1', ['C']);
    TempRoster.currentRoster[3]![0] = Player('Player', '2', ['1B', '3B']);
    TempRoster.currentRoster[4]![0] = Player('Player', '3', ['2B', 'OF']);
    TempRoster.currentRoster[8]!.add(Player('Player', '4', ['3B', 'OF']));
    TempRoster.currentRoster[6]![0] = Player('Player', '5', ['SS']);
    TempRoster.currentRoster[7]![0] = Player('Player', '6', ['OF']);
    TempRoster.currentRoster[7]![1] = Player('Player', '7', ['OF']);
    TempRoster.currentRoster[7]![2] = Player('Player', '8', ['OF', 'SS', '3B']);

    return appScaffold(
        context,
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigCard(first: 'home', second: 'screen'),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [SizedBox(width: 10)],
              ),
            ],
          ),
        ),
        this,
        null);
  }

  static int getPositionMax(int pos) {
    int max = 1;

    switch (pos) {
      case 0:
      case 1:
        max = 4;
        break;
      case 7:
        max = 3;
    }
    return max;
  }
}
