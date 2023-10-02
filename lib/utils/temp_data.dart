import 'package:fantasy_draft/models/Matchup.dart';
import 'package:fantasy_draft/models/Roster.dart';
import 'package:fantasy_draft/utils/data_initializers.dart';

class TempData {
  static Roster tempRoster = DataInitializers.initializeRoster();
  static List<Matchup> leagueMatchups = [];
  static bool seasonStarted = false;

  static Roster getTempRoster() {
    return tempRoster;
  }

  static void setTempRoster(Roster roster) {
    tempRoster = roster;
  }

  static void clearTempRoster() {
    tempRoster = DataInitializers.initializeRoster();
  }

  static List<Matchup> getCurrentMatchups(int week) {
    return week > 0
        ? leagueMatchups
        : leagueMatchups.where((element) => element.week == week).toList();
  }

  static void setCurrentMatchups(List<Matchup> matchup) {
    leagueMatchups = matchup;
  }

  static void clearCurrentMatchups() {
    leagueMatchups = [];
  }

  static Map<int, List<String>> getTempRosterAsMap() {
    return {};
  }
}
