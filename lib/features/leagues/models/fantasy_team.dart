// import 'package:fantasy_draft/features/leagues/models/fantasy_league_manager.dart';
// import 'package:fantasy_draft/features/leagues/models/league_stats.dart';
// import 'package:fantasy_draft/features/player_management/models/player.dart';

// //TODO: migrate fantasy team functuions to Team data model
// class FantasyTeam {
//   final int _leagueID;
//   final FantasyLeagueManager _owner;

//   int _addCount = 0;
//   int _tradeCount = 0;
//   int _rank = 1;
//   double totalGames = 0;

//   String? _header;
//   String? _logo;
//   String _name;

//   Map<int, List<Player>> roster;

//   //R, HR, SB, OPS, W, SV, K, ERA, WHIP, etc...
//   List<String> _leagueStatCategories = [];

//   List<int> _record = [0, 0, 0];
//   //create local roster (player list with assigned positions), which will then be stored in db

//   FantasyStats _seasonStats = FantasyStats();
//   FantasyStats _weeklyStats = FantasyStats();
//   FantasyStats _dailyStats = FantasyStats();

//   FantasyTeam(this._owner, this._name, this._leagueStatCategories,
//       this._leagueID, this.roster,
//       [this._logo, this._header]) {
//     //  for(String s in TempFantasyLeague.getStatCategories()){
//     //   _seasonStats[s] = 0;
//     //   _weeklyStats[s] = 0;
//     //   _dailyStats[s] = 0;
//     //  }
//   }

//   void resetDailyStats() {
//     _dailyStats.reset();
//   }

//   Map<String, dynamic> getDailyStats() {
//     return _dailyStats.getStats(_leagueStatCategories);
//   }

//   Map<String, dynamic> getWeeklyStats() {
//     return _weeklyStats.getStats(_leagueStatCategories);
//   }

//   Map<String, dynamic> getSeasonStats() {
//     return _seasonStats.getStats(_leagueStatCategories);
//   }

//   void resetWeeklyStats() {
//     _weeklyStats = FantasyStats();
//   }

//   void addStats(Map<String, int> statPackage) {
//     _dailyStats.addStats(statPackage);
//     _weeklyStats.addStats(statPackage);
//     _seasonStats.addStats(statPackage);
//   }

//   int getLeagueID() {
//     return _leagueID;
//   }

//   FantasyLeagueManager getOwner() {
//     return _owner;
//   }

//   void editName(String name) {
//     _name = name;
//   }

//   String getName() {
//     return _name;
//   }

//   replaceLogo(String logo) {
//     _logo = _logo;
//   }

//   String getLogo() {
//     return _logo!;
//   }

//   replaceHeader(String header) {
//     _header = header;
//   }

//   String getHeader() {
//     return _header!;
//   }

//   void setRank(int r) {
//     _rank = r;
//   }

//   int getRank() {
//     return _rank;
//   }

//   void incrementAdds() {
//     _addCount++;
//   }

//   int getAddCount() {
//     return _addCount;
//   }

//   void imcrementTrades() {
//     _tradeCount++;
//   }

//   int getTradeCount() {
//     return _tradeCount;
//   }

//   void addLeagueStatCategory(String category) {
//     _leagueStatCategories.add(category);
//   }

//   List<String> getLeagueStatCategories() {
//     return _leagueStatCategories;
//   }

//   updateRecord(int w, int l, int t) {
//     totalGames += w;
//     totalGames -= l;
//     totalGames += (t * 0.5);

//     _record[0] += w;
//     _record[1] += l;
//     _record[2] += t;
//   }

//   List<int> getRecord() {
//     return _record;
//   }

//   double getTotalGames() {
//     return totalGames;
//   }

//   void setRoster(Map<int, List<Player>> r) {
//     //print(r);
//     roster = r;
//   }

//   Map<int, List<Player>> getRoster() {
//     return roster;
//   }
// }
