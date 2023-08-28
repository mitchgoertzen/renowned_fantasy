import 'package:fantasy_draft/features/leagues/models/fantasy_league_manager.dart';
import 'package:fantasy_draft/features/leagues/models/fantasy_team.dart';
import 'package:fantasy_draft/features/leagues/models/matchup.dart';
import 'package:fantasy_draft/features/leagues/models/temp_available_players.dart';
import 'package:fantasy_draft/features/leagues/models/temp_fantasy_league.dart';
import 'package:fantasy_draft/features/leagues/models/temp_roster.dart';
import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:fantasy_draft/global_widgets/Card.dart';
import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<AppState>();
    // var currentPlayer = appState.current;

    FantasyLeagueManager memberA = FantasyLeagueManager('A', 'email');
    FantasyLeagueManager memberB = FantasyLeagueManager('B', 'email');
    FantasyLeagueManager memberC = FantasyLeagueManager('C', 'email');
    FantasyLeagueManager memberD = FantasyLeagueManager('D', 'email');

    TempFantasyLeague.leagueManagers = [memberA, memberB, memberC, memberD];

    TempFantasyLeague.statCategories = ['R', 'HR', 'RBI', 'SB', 'OPS'];

    TempFantasyLeague.leagueTeams.clear();
    for (int i = 0; i < 4; i++) {
      TempFantasyLeague.leagueTeams.add(FantasyTeam(
          TempFantasyLeague.leagueManagers[i],
          '${TempFantasyLeague.leagueManagers[i].getName()}\'s Team',
          TempFantasyLeague.statCategories,
          TempFantasyLeague.id, {}));
    }

    Player emptyPlayer = TempFantasyLeague.emptyPlayer;

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

    TempRoster.currentRoster[2]![0] =
        Player(TempFantasyLeague.leagueTeams[0], 'Player', '1-1', ['C']);
    TempRoster.currentRoster[3]![0] = Player(
        TempFantasyLeague.leagueTeams[0], 'Player', '1-2', ['1B', '3B']);
    TempRoster.currentRoster[4]![0] =
        Player(TempFantasyLeague.leagueTeams[0], 'Player', '1-3', ['2B']);
    TempRoster.currentRoster[8]!.add(Player(
        TempFantasyLeague.leagueTeams[0], 'Player', '1-4', ['3B', 'OF']));
    TempRoster.currentRoster[6]![0] =
        Player(TempFantasyLeague.leagueTeams[0], 'Player', '1-5', ['SS']);
    TempRoster.currentRoster[7]![0] =
        Player(TempFantasyLeague.leagueTeams[0], 'Player', '1-6', ['OF']);
    TempRoster.currentRoster[7]![1] =
        Player(TempFantasyLeague.leagueTeams[0], 'Player', '1-7', ['OF']);
    TempRoster.currentRoster[7]![2] = Player(
        TempFantasyLeague.leagueTeams[0],
        'Player',
        '1-8',
        ['OF', 'SS', '3B']);

    TempAvailPlayers.availablePlayers.clear();
    TempAvailPlayers.addPlayer(
        Player(TempFantasyLeague.emptyTeam, 'Player', '12', ['C', 'OF']));
    TempAvailPlayers.addPlayer(
        Player(TempFantasyLeague.emptyTeam, 'Player', '13', ['2B', 'SS']));
    TempAvailPlayers.addPlayer(
        Player(TempFantasyLeague.emptyTeam, 'Player', '14', ['OF']));
    TempAvailPlayers.addPlayer(
        Player(TempFantasyLeague.emptyTeam, 'Player', '15', ['3B', 'OF']));
    TempAvailPlayers.addPlayer(
        Player(TempFantasyLeague.emptyTeam, 'Player', '16', ['SP', 'RP']));
    TempAvailPlayers.addPlayer(
        Player(TempFantasyLeague.emptyTeam, 'Player', '17', ['SP', 'RP']));

    TempFantasyLeague.leagueTeams[0].setRoster(TempRoster.getRoster());
    //each team 3 weeks, 2 days per week, 1 PA per day

    TempFantasyLeague.matchups.clear();
    TempFantasyLeague.matchups.add(Matchup(
        teamA: TempFantasyLeague.leagueTeams[0],
        teamB: TempFantasyLeague.leagueTeams[2]));

    TempFantasyLeague.matchups.add(Matchup(
        teamA: TempFantasyLeague.leagueTeams[1],
        teamB: TempFantasyLeague.leagueTeams[3]));

    // //team 1 week 1
    // TempFantasyLeague.leagueTeams[0].addStats({
    //   "plateAppearance": 1,
    //   "atBat": 1,
    //   "hit": 1,
    //   "homeRun": 1,
    //   "rbi": 3,
    //   "run": 1
    // });
    // TempFantasyLeague.leagueTeams[0].resetDailyStats();
    // TempFantasyLeague.leagueTeams[0]
    //     .addStats({"plateAppearance": 1, "atBat": 1, "hit": 1, "single": 1});
    // TempFantasyLeague.leagueTeams[0].resetDailyStats();

    // //Team 2 Week 1
    // TempFantasyLeague.leagueTeams[1]
    //     .addStats({"plateAppearance": 1, "atBat": 1});
    // TempFantasyLeague.leagueTeams[1].resetDailyStats();
    // TempFantasyLeague.leagueTeams[1].addStats(
    //     {"plateAppearance": 1, "atBat": 1, "hit": 1, "double": 1, "rbi": 1});
    // TempFantasyLeague.leagueTeams[1].resetDailyStats();

    // //team 3 week 1
    // TempFantasyLeague.leagueTeams[2]
    //     .addStats({"plateAppearance": 1, "atBat": 1});
    // TempFantasyLeague.leagueTeams[2].resetDailyStats();
    // TempFantasyLeague.leagueTeams[2]
    //     .addStats({"plateAppearance": 1, "atBat": 1});
    // TempFantasyLeague.leagueTeams[2].resetDailyStats();

    // //team 4 week 1
    // TempFantasyLeague.leagueTeams[3]
    //     .addStats({"plateAppearance": 1, "atBat": 1});
    // TempFantasyLeague.leagueTeams[3].resetDailyStats();
    // TempFantasyLeague.leagueTeams[3]
    //     .addStats({"plateAppearance": 1, "atBat": 1});
    // TempFantasyLeague.leagueTeams[3].resetDailyStats();

    // TempFantasyLeague.updateStandings();

    // TempFantasyLeague.leagueTeams[0].resetWeeklyStats();
    // TempFantasyLeague.leagueTeams[1].resetWeeklyStats();
    // TempFantasyLeague.leagueTeams[3].resetWeeklyStats();
    // TempFantasyLeague.leagueTeams[2].resetWeeklyStats();

    // TempFantasyLeague.matchups.clear();
    // TempFantasyLeague.matchups.add(Matchup(
    //     teamA: TempFantasyLeague.leagueTeams[0],
    //     teamB: TempFantasyLeague.leagueTeams[1]));

    // TempFantasyLeague.matchups.add(Matchup(
    //     teamA: TempFantasyLeague.leagueTeams[2],
    //     teamB: TempFantasyLeague.leagueTeams[3]));

    // //team 1 week 2
    // TempFantasyLeague.leagueTeams[0]
    //     .addStats({"plateAppearance": 1, "atBat": 1});

    // TempFantasyLeague.leagueTeams[0].resetDailyStats();
    // TempFantasyLeague.leagueTeams[0]
    //     .addStats({"plateAppearance": 1, "atBat": 1});

    // TempFantasyLeague.leagueTeams[0].resetDailyStats();

    // //team 2 week 2
    // TempFantasyLeague.leagueTeams[1]
    //     .addStats({"plateAppearance": 1, "atBat": 1, "hit": 1, "single": 1});

    // TempFantasyLeague.leagueTeams[1].resetDailyStats();
    // TempFantasyLeague.leagueTeams[1]
    //     .addStats({"plateAppearance": 1, "atBat": 1});
    // TempFantasyLeague.leagueTeams[1].addStats({"stolenBase": 1});

    // TempFantasyLeague.leagueTeams[1].resetDailyStats();

    // //team 3 week 2
    // TempFantasyLeague.leagueTeams[2].addStats({
    //   "plateAppearance": 1,
    //   "atBat": 1,
    //   "hit": 1,
    //   "single": 1,
    // });

    // TempFantasyLeague.leagueTeams[2].resetDailyStats();
    // TempFantasyLeague.leagueTeams[2].addStats({
    //   "plateAppearance": 1,
    //   "atBat": 1,
    // });
    // TempFantasyLeague.leagueTeams[2].resetDailyStats();

    // //team 4 week 2
    // TempFantasyLeague.leagueTeams[3]
    //     .addStats({"plateAppearance": 1, "atBat": 1});

    // TempFantasyLeague.leagueTeams[3].resetDailyStats();
    // TempFantasyLeague.leagueTeams[3]
    //     .addStats({"plateAppearance": 1, "atBat": 1});

    // TempFantasyLeague.leagueTeams[3].resetDailyStats();

    // TempFantasyLeague.updateStandings();

    // TempFantasyLeague.leagueTeams[0].resetWeeklyStats();
    // TempFantasyLeague.leagueTeams[1].resetWeeklyStats();
    // TempFantasyLeague.leagueTeams[2].resetWeeklyStats();
    // TempFantasyLeague.leagueTeams[3].resetWeeklyStats();

    TempFantasyLeague.matchups.clear();
    TempFantasyLeague.matchups.add(Matchup(
        teamA: TempFantasyLeague.leagueTeams[0],
        teamB: TempFantasyLeague.leagueTeams[3]));

    TempFantasyLeague.matchups.add(Matchup(
        teamA: TempFantasyLeague.leagueTeams[1],
        teamB: TempFantasyLeague.leagueTeams[2]));

    //team 1 week 3
    TempRoster.currentRoster[2]?[0].addStats({"plateAppearance": 1, "atBat": 1});
    // TempFantasyLeague.leagueTeams[0]
    //     .addStats({"plateAppearance": 1, "atBat": 1});

    TempFantasyLeague.leagueTeams[0].resetDailyStats();
    TempRoster.currentRoster[3]?[0].addStats({
      "plateAppearance": 1,
      "atBat": 1,
      "hit": 1,
      "homeRun": 1,
      "rbi": 1,
      "run": 1
    });

    //team 2 week 3
    TempFantasyLeague.leagueTeams[1]
        .addStats({"plateAppearance": 1, "atBat": 1});

    TempFantasyLeague.leagueTeams[1].resetDailyStats();
    TempFantasyLeague.leagueTeams[1]
        .addStats({"plateAppearance": 1, "atBat": 1});
    TempFantasyLeague.leagueTeams[1]
        .addStats({"plateAppearance": 1, "atBat": 1, "hit": 1, "single": 1});
    TempFantasyLeague.leagueTeams[1].addStats({"stolenBase": 1});

    //team 3 week 3
    TempFantasyLeague.leagueTeams[2]
        .addStats({"plateAppearance": 1, "atBat": 1, "rbi": 1});

    TempFantasyLeague.leagueTeams[2].resetDailyStats();
    TempFantasyLeague.leagueTeams[2]
        .addStats({"plateAppearance": 1, "atBat": 1});
    TempFantasyLeague.leagueTeams[2].addStats({"run": 1});

    //team 4 week 3
    TempFantasyLeague.leagueTeams[3]
        .addStats({"plateAppearance": 1, "atBat": 1, "hit": 1, "triple": 1});

    TempFantasyLeague.leagueTeams[3].resetDailyStats();
    TempFantasyLeague.leagueTeams[3].addStats({
      "plateAppearance": 1,
      "atBat": 1,
      "hit": 1,
      "homeRun": 1,
      "rbi": 1,
      "run": 1
    });

    TempFantasyLeague.updateStandings();

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
