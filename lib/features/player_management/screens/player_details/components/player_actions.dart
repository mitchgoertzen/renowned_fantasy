import 'package:fantasy_draft/global_components/button_column_builder.dart';
import 'package:flutter/material.dart';

class PlayerActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    int i = 0;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(color, Icons.not_interested, 'Drop',
            (int? i) => playerControlFunction(i), 0),
        buildButtonColumn(color, Icons.people_rounded, 'Compare',
            (int? i) => playerControlFunction(i), 1),
        buildButtonColumn(color, Icons.comment, 'Comment',
            (int? i) => playerControlFunction(i), 2),
      ],
    );

    return buttonSection;
  }

  void playerControlFunction(int? i) {
    switch (i ?? 0) {
      case 0:
        {
          print('add/drop/trade');
        }
        break;
      case 1:
        {
          print('compare');
        }
        break;
      case 2:
        {
          print('comment');
        }
        break;
      default:
        print('nothing');
    }
  }
}
