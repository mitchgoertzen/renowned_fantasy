// import 'package:fantasy_draft/features/leagues/models/fantasy_team.dart';
// import 'package:fantasy_draft/features/leagues/models/league_stats.dart';

// class Player {
//   //TODO: convert to List<int>
//   List<String> positions = ['x'];

//   late int id;

//   late String first;
//   late String last;

//   late FantasyTeam team;

//   FantasyStats _stats = FantasyStats();

//   Player(FantasyTeam t, String f, String l, List<String> p) {
//     team = t;
//     first = f;
//     last = l;
//     positions.addAll(p);
//     id = '$first $last'.hashCode;
//   }

//   void addStats(Map<String, int> statPackage) {
//     //print('$first $last');
//     _stats.addStats(statPackage);
//     team.addStats(statPackage);
//   }
// }
