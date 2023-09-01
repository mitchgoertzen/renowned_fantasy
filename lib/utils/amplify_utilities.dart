import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fantasy_draft/models/League.dart';
import 'package:fantasy_draft/models/Manager.dart';
import 'package:fantasy_draft/utils/shared_preference_utilities.dart';

class AmplifyUtilities {
  static Future<Manager?> getCurrentManager() async {
    String id = await SharedPreferencesUtilities.getCurrentUserID();
    try {
      final request =
          ModelQueries.list(Manager.classType, where: Manager.ID.eq(id));
      final response = await Amplify.API.query(request: request).response;

      final managers = response.data!.items;

      if (response.hasErrors) {
        safePrint('errors: ${response.errors}');
        return null;
      }

      return managers.whereType<Manager>().toList().first;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }

    return null;
  }

  static Future<League?> getCurrentLeague() async {
    String id = await SharedPreferencesUtilities.getCurrentLeagueID();

    try {
      final request =
          ModelQueries.list(League.classType, where: League.ID.eq(id));
      final response = await Amplify.API.query(request: request).response;

      final leagues = response.data!.items;

      if (response.hasErrors) {
        safePrint('errors: ${response.errors}');
        return null;
      }

      return leagues.whereType<League>().toList().first;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }

    return null;
  }
}
