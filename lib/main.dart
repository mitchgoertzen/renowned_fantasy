import 'package:fantasy_draft/features/player_management/models/Player.dart';
import 'package:fantasy_draft/theme/theme.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import 'features/main/screens/home.dart';

void main() {
  runApp(FantasyDraft());
}

class FantasyDraft extends StatefulWidget {
  @override
  State<FantasyDraft> createState() => FantasyDraftState();
}

class FantasyDraftState extends State<FantasyDraft> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Draft App',
        theme: appDefaultTheme(),
        home: AppHome(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  var current = Player('Randy', 'Arozarena');
  var favourites = {};

  void setCurrent(Player p) {
    print(p.first);
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


