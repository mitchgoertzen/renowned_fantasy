import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:fantasy_draft/models/Player.dart';
import 'package:fantasy_draft/theme/theme.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'aws/configure_amplify.dart';
import 'features/main/screens/home.dart';

//TODO: add debug output to log, replace print statements

//main function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(FantasyDraft());
}

//app
class FantasyDraft extends StatefulWidget {
  @override
  State<FantasyDraft> createState() => FantasyDraftState();
}

//app state
class FantasyDraftState extends State<FantasyDraft> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //load authenticator on startup
    return Authenticator(
        //provide change notifier for app state
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

//will probably be obsolete
class AppState extends ChangeNotifier {
  var current = Player();
  var favourites = {};

  void setCurrent(Player p) {
    current = p;
    notifyListeners();
  }

//TODO: move somewhere else
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
