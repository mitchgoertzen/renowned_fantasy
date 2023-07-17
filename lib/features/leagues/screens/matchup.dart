import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:flutter/material.dart';

class Matchup extends StatelessWidget {
  const Matchup({super.key});
  
  @override
  Widget build(BuildContext context) {
    return appScaffold(
      context,

        ListView(
          children: [
           Text('matchup'),

          ],
        ),
        this

    );
  }
}
