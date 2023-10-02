import 'package:fantasy_draft/global_components/statistic_box.dart';
import 'package:fantasy_draft/models/Team.dart';

leagueStandings() {
  List<String> categories = ['Team', 'W', 'L', 'T', 'GB'];
  List<Team> teams = []; //getleagueteams()

  List<List<String>> teamData = [];
  double topTeamTotalGames = 0;

  for (var t in teams) {
    String gamesBehind = (topTeamTotalGames - t.record!.totalGames!).toString();
    if (gamesBehind == '0.0') {
      gamesBehind = '--';
    }

    teamData.add([
      t.name,
      t.record!.wins.toString(),
      t.record!.wins.toString(),
      t.record!.wins.toString(),
      gamesBehind
    ]);

    // print('${t.getName()} total games: ${t.getTotalGames()}');
  }
  return StatisticBox(xAxisLabels: categories, yAxisValues: teamData);
}
