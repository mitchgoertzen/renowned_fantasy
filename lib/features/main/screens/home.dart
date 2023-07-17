import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:fantasy_draft/global_widgets/Card.dart';
import 'package:fantasy_draft/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var currentPlayer = appState.current;

    return appScaffold(
        context,
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigCard(first: currentPlayer.first, second: currentPlayer.last),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [SizedBox(width: 10)],
              ),
            ],
          ),
        ),
        this,
        null);
  }
}
