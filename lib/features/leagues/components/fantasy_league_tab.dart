import 'package:flutter/material.dart';

//stateless?
class FantasyLeagueTab extends StatefulWidget {
  final GlobalKey navigatorKey;
  final Widget child;

  FantasyLeagueTab({required this.navigatorKey, required this.child});

  @override
  State<FantasyLeagueTab> createState() => _FantasyLeagueTabState();
}

class _FantasyLeagueTabState extends State<FantasyLeagueTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return widget.child;
          },
        );
      },
    );
  }
}
