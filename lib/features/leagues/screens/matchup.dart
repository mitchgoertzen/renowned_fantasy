import 'package:fantasy_draft/global_components/AppScaffold.dart';
import 'package:flutter/material.dart';

class Matchup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appScaffold(
      context,

        ListView(
          children: [
           Text('matchup'),

          ],
        )

    );
  }
}
