import 'package:fantasy_draft/features/leagues/screens/matchup.dart';
import 'package:fantasy_draft/features/leagues/screens/watchlist.dart';
import 'package:fantasy_draft/features/player_management/screens/player_details/player_details_screen.dart';
import 'package:fantasy_draft/global_components/AppScaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/leagues/screens/league.dart';
import 'features/leagues/screens/team.dart';
import 'features/player_management/models/Player.dart';
import 'features/player_management/screens/player_add.dart';
import 'main.dart';

class NavList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return appScaffold(
        context,
        GridView.count(
            padding: EdgeInsets.all(15),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: [
              navButton(context, League(), 'League'),
              navButton(context, Placeholder(), 'Leagues Home'),
              navButton(context, Matchup(), 'Matchup'),
              navButton(context, Team(), 'My Team'),
              navButton(
                  context, PlayerDetails(appState.current), 'Player Details'),
              navButton(context, PlayerAdd(), 'Player Add'),
              navButton(context, Placeholder(), 'Stats'),
              navButton(context, Watchlist(), 'Watchlist'),
            ]));
  }
}

ElevatedButton navButton(BuildContext context, Widget page, String label) {
  return ElevatedButton(
    onPressed: () {
      Navigator.of(context).push(_createRoute(page));
    },
    child: Text(textAlign: TextAlign.center, label),
  );
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
