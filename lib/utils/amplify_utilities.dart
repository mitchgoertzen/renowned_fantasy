import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fantasy_draft/models/League.dart';
import 'package:fantasy_draft/models/Manager.dart';
import 'package:fantasy_draft/models/Player.dart';
import 'package:fantasy_draft/models/Team.dart';
import 'package:fantasy_draft/utils/shared_preference_utilities.dart';

class AmplifyUtilities {
  static Future<League?> getCurrentLeague() async {
    try {
      final leaguesRequest = ModelQueries.list(League.classType,
          where: League.ID
              .eq(await SharedPreferencesUtilities.getCurrentLeagueID()));
      final leaguesResponse =
          await Amplify.API.query(request: leaguesRequest).response;

      if (leaguesResponse.hasErrors) {
        safePrint('errors: ${leaguesResponse.errors}');
        return null;
      }

      final leagues = leaguesResponse.data!.items;

      return leagues.whereType<League>().toList().first;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }

    return null;
  }

  static Future<Manager?> getCurrentManager() async {
    try {
      final managersRequest = ModelQueries.list(Manager.classType,
          where: Manager.ID
              .eq(await SharedPreferencesUtilities.getCurrentUserID()));
      final managersResponse =
          await Amplify.API.query(request: managersRequest).response;

      if (managersResponse.hasErrors) {
        safePrint('errors: ${managersResponse.errors}');
        return null;
      }
      final managers = managersResponse.data!.items;

//TODO: add check for no element
      return managers.whereType<Manager>().toList().first;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }

    return null;
  }

  static Future<Team?> getCurrentTeam() async {
    try {
      final teamsRequest = ModelQueries.list(Team.classType,
          where: Team.LEAGUEID
              .eq(await SharedPreferencesUtilities.getCurrentLeagueID()));
      final teamsResponse =
          await Amplify.API.query(request: teamsRequest).response;

      if (teamsResponse.hasErrors) {
        safePrint('errors: ${teamsResponse.errors}');
        return null;
      }

      final teams = teamsResponse.data!.items;
      String currentManagerID =
          await SharedPreferencesUtilities.getCurrentManager();

      //1 or more teams in the league
      if (teams.isNotEmpty) {
        Iterable<Team?> currentUsersTeam =
            teams.where((element) => element!.manager == currentManagerID);

        //current user has a team in current league
        if (currentUsersTeam.isNotEmpty) {
          return currentUsersTeam.first;
        }
      }

      return Team(name: "", manager: "", leagueID: "");
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }

    return null;
  }

  static Future<Map<int, List<String>>> getCurrentRosterPlayers() async {
    Map<int, List<String>> players = {};
    try {
      final currentTeam = await getCurrentTeam();
      print(currentTeam!.name);
      final teamRoster = currentTeam!.roster;

      players.putIfAbsent(0, () => teamRoster!.startingPitchers);
      players.putIfAbsent(1, () => teamRoster!.reliefPitchers);
      players.putIfAbsent(2, () => teamRoster!.catcher);
      players.putIfAbsent(3, () => teamRoster!.firstBase);
      players.putIfAbsent(4, () => teamRoster!.secondBase);
      players.putIfAbsent(5, () => teamRoster!.thirdBase);
      players.putIfAbsent(6, () => teamRoster!.shortStop);

      //includes player positions 8,9
      players.putIfAbsent(7, () => teamRoster!.outfielders);

      return players;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
    return {};
  }

  static Future<Team?> getTeam(String teamID) async {
    try {
      final teamsRequest = ModelQueries.list(Team.classType,
          where: Team.LEAGUEID
                  .eq(await SharedPreferencesUtilities.getCurrentLeagueID()) &
              Team.MANAGER.eq(teamID));
      final teamsResponse =
          await Amplify.API.query(request: teamsRequest).response;

      if (teamsResponse.hasErrors) {
        safePrint('errors: ${teamsResponse.errors}');
        return null;
      }

      final teams = teamsResponse.data!.items;

      return teams.whereType<Team>().toList().first;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }

    return null;
  }

  static Future<Player> getPlayer(String id) async {
    Player? p;
    League? l;
    String teamID = await SharedPreferencesUtilities.getCurrentTeamID();

    try {
      l = await getCurrentLeague();

      // final players = l!.leaguePlayers.where(element => element.teamID = teamID).toList();
      // p = players![0];

      //return teams.whereType<Team>().toList().first;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }

    return p!;
  }

  static Future<Map<String, dynamic>> getTeamStats(
      String team, int timeRange) async {
    Team? currentTeam = await getTeam(team);

    return currentTeam!.battingStats![0].toJson();
  }

  static Future<void> signOutCurrentUser() async {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      safePrint('Sign out completed successfully');
    } else if (result is CognitoFailedSignOut) {
      safePrint('Error signing user out: ${result.exception.message}');
    }
  }
}
