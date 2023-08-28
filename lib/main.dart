import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:fantasy_draft/features/leagues/models/temp_fantasy_league.dart';
import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/theme/theme.dart';
import 'package:fantasy_draft/utils/shared_preference_utilities.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import 'aws/configure_amplify.dart';
import 'features/main/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(FantasyDraft());
}

class FantasyDraft extends StatefulWidget {
  @override
  State<FantasyDraft> createState() => FantasyDraftState();
}

class FantasyDraftState extends State<FantasyDraft> {

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtilities.clearIDs();
    SharedPreferencesUtilities.setCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Authenticator(
        child: ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        builder: Authenticator.builder(),
        title: 'Draft App',
        theme: appDefaultTheme(),
        home: AppHome(),
      ),
    ));
  }
}

class AppState extends ChangeNotifier {
  var current =
      Player(TempFantasyLeague.emptyTeam, 'Randy', 'Arozarena', ['OF']);
  var favourites = {};

  void setCurrent(Player p) {
    current = p;
    notifyListeners();
  }

  void toggleWatchlist() {
    if (favourites[current.id] != null) {
      favourites.remove(current.id);
    } else {
      favourites[current.id] = current;
    }
    notifyListeners();
  }

  void removeFavourite(int id) {
    favourites.remove(id);
    notifyListeners();
  }
}
