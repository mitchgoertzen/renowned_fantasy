import 'package:fantasy_draft/features/leagues/models/fantasy_team.dart';
import 'package:fantasy_draft/features/leagues/models/temp_fantasy_league.dart';
import 'package:fantasy_draft/global_components/statistic_box.dart';

leagueStandings() {
  List<String> categories = ['Team', 'W', 'L', 'T', 'GB'];
  List<FantasyTeam> teams = TempFantasyLeague.leagueTeams;

  List<List<String>> teamData = [];

  for (var t in teams) {
    String gamesBehind = (TempFantasyLeague.topTeamTotalGames - t.getTotalGames()).toString();
    if(gamesBehind == '0.0'){
      gamesBehind = '--';
    }

    teamData.add([
      t.getName(),
      t.getRecord()[0].toString(),
      t.getRecord()[1].toString(),
      t.getRecord()[2].toString(),
      gamesBehind
    ]);


    // print('${t.getName()} total games: ${t.getTotalGames()}');
  }
  return StatisticBox(xAxisLabels: categories, yAxisValues: teamData);
}
