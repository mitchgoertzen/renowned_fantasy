// import 'package:fantasy_draft/features/leagues/models/fantasy_team.dart';

// class Matchup {
//   late FantasyTeam teamA;
//   late FantasyTeam teamB;

//   Matchup({required this.teamA, required this.teamB});

//   List<int> calculateScore() {
//     int scoreA = 0;
//     int scoreB = 0;

//     Map<String, dynamic> teamAStats = teamA.getWeeklyStats();
//     Map<String, dynamic> teamBStats = teamB.getWeeklyStats();

//     teamAStats.forEach((k, v) => {
//           if (v > teamBStats[k])
//             {scoreA++}
//           else if (v < teamBStats[k])
//             {scoreB++}
//         });

//     return [scoreA, scoreB];
//   }
// }
