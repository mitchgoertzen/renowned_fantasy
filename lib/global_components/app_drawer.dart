import 'package:fantasy_draft/features/leagues/league_navigator.dart';
import 'package:fantasy_draft/nav_list.dart';
import 'package:fantasy_draft/utils/navigation_animation.dart';
import 'package:flutter/material.dart';

import '../features/main/screens/home.dart';

FractionallySizedBox appDrawer(BuildContext context, Widget currentPage) {

  var theme = Theme.of(context);
  return FractionallySizedBox(
      widthFactor: 0.6,
      child: Center(
          child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Drawer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 75,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceTint,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Drawer Header',
                        style: TextStyle(
                            color: theme.colorScheme.secondaryContainer)),
                  ),
                )),
            _createDrawerButton(context, currentPage, AppHome(), Icons.home, 'Home'),
            _createDrawerButton(
                context, currentPage, LeagueNavigator(), Icons.emoji_events, 'Leagues'),
            _createDrawerButton(
                context, currentPage, Placeholder(), Icons.person, 'Profile'),
            _createDrawerButton(
                context, currentPage, NavList(), Icons.add_box_sharp, 'Nav'),
            SizedBox(
              height: 12,
            ),
            Divider(color: theme.colorScheme.primary),
            _createDrawerButton(
                context, currentPage, Placeholder(), Icons.settings, 'Settings'),
          ],
        )),
      )));
}

Row _createDrawerButton(
    BuildContext context, Widget currentPage, Widget newPage, IconData icon, String label) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    TextButton.icon(
      onPressed: () {
        Navigator.pop(context);

      //  print(currentPage.toString());
      //  print(newPage.toString());
        if(newPage.toString() != currentPage.toString()){
          Future.delayed(Duration(milliseconds: 200), () {
            Navigator.of(context).push(NavigationAnimation.createRoute(newPage));
          });
        }
      },
      icon: Icon(icon),
      label: Text(style: TextStyle(color: Colors.black),label),
    ),
  ]);
}
