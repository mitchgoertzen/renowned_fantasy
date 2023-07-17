import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:fantasy_draft/global_components/expandable_list_item.dart';
import 'package:flutter/material.dart';

class League extends StatelessWidget {
  const League({super.key});

  @override
  Widget build(BuildContext context) {
    return appScaffold(
        context,
        ListView(
          children: [
            ExpandableListItem(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(),
                    Text(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        'Team 1'),
                    Text('5'),
                    Text('4'),
                    Text(
                        style: TextStyle(fontWeight: FontWeight.bold), 'Team 2')
                  ],
                ),
                body: Text('matchup results'))
          ],
        ),
        this);
  }
}
