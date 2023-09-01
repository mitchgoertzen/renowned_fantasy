//TODO: rename class?
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtilities {
  static Future<void> setCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final currentUser = await Amplify.Auth.getCurrentUser();
    String currentID = currentUser.userId;
    String currentManager = currentUser.username;
    prefs.setString('currentUserID', currentID);
    prefs.setString('currentManager', currentManager);
  }

  static Future<String> getCurrentUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentUserID') ?? '';
  }

  static Future<String> getCurrentManager() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentManager') ?? '';
  }

  static Future<void> setCurrentLeagueID(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentLeagueID', id);
  }

  static Future<String> getCurrentLeagueID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentLeagueID') ?? '';
  }

  //TODO: set current Team?
  static Future<String> setCurrentTeamID(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentTeamID', id);
    return id;
  }

  static Future<String> getCurrentTeamID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentTeamID') ?? '';
  }

  static Future<void> clearIDs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //TODO: set strings to variables to avoid typos
    prefs.remove('currentUserID');
    prefs.remove('currentManager');
    prefs.remove('currentLeagueID');
    prefs.remove('currentTeamID');
  }
}
