import 'package:fantasy_draft/features/leagues/screens/matchup_page.dart';
import 'package:fantasy_draft/features/leagues/screens/watchlist_page.dart';
import 'package:fantasy_draft/features/player_management/screens/player_details/player_details_screen.dart';
import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:fantasy_draft/utils/navigation_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/leagues/models/temp_fantasy_league.dart';
import 'features/leagues/screens/fantasy_league_page.dart';
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
              navButton(context, FantasyLeaguePage(), 'League'),
              navButton(context, Placeholder(), 'Leagues Home'),
              navButton(context, MatchupPage(matchup: TempFantasyLeague.matchups[0]), 'Matchup'),
              navButton(context, PlayerDetails(appState.current), 'Player Details'),
              //navButton(context, PlayerAdd(playerToAdd: Player('f', '', ['']),), 'Player Add'),
              navButton(context, Placeholder(), 'Stats'),
              navButton(context, Watchlist(), 'Watchlist'),
            ]),
            this,
            null);
  }
}

ElevatedButton navButton(BuildContext context, Widget page, String label) {
  return ElevatedButton(
    onPressed: () {
      Navigator.of(context).push(NavigationAnimation.createRoute(page));
    },
    child: Text(textAlign: TextAlign.center, label),
  );
}


