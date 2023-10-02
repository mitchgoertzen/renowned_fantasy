// import 'package:fantasy_draft/features/leagues/models/fantasy_league_manager.dart';
// import 'package:fantasy_draft/features/leagues/models/fantasy_team.dart';
// import 'package:fantasy_draft/models/Player.dart';
// import 'matchup.dart';

// class TempFantasyLeague {
//   static int id = 0;
//   static double topTeamTotalGames = 0;

//   static List<FantasyLeagueManager> leagueManagers = [];
//   //TODO: map of team id, team
//   static List<FantasyTeam> leagueTeams = [];
//   static List<Matchup> matchups = [];
//   static List<String> statCategories = [];

//   static FantasyTeam emptyTeam =
//       FantasyTeam(FantasyLeagueManager('', ''), '', statCategories, id, {});
//   static Player emptyPlayer = Player(teamID: '');

//   static List<String> getStatCategories() {
//     return statCategories;
//   }

//   static List<Matchup> getMatchups() {
//     return matchups;
//   }

//   static void updateStandings() {
//     for (Matchup m in matchups) {
//       List<int> scores = m.calculateScore();
//       leagueTeams[leagueTeams.indexOf(m.teamA)].updateRecord(scores[0],
//           scores[1], statCategories.length - (scores[0] + scores[1]));
//       leagueTeams[leagueTeams.indexOf(m.teamB)].updateRecord(scores[1],
//           scores[0], statCategories.length - (scores[0] + scores[1]));
//       if (m.teamA.getTotalGames() > topTeamTotalGames) {
//         topTeamTotalGames = m.teamA.getTotalGames();
//       }
//       if (m.teamB.getTotalGames() > topTeamTotalGames) {
//         topTeamTotalGames = m.teamB.getTotalGames();
//       }
//     }
//   }
// }
