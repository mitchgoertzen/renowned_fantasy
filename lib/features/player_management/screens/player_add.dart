import 'package:fantasy_draft/global_components/AppScaffold.dart';
import 'package:fantasy_draft/global_components/draggable_item.dart';
import 'package:flutter/material.dart';

class PlayerAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return appScaffold(
        context,
        Column(
          children: [
            Expanded(
              child: Row(children: [
                Container(color: Colors.red, child: Text('ansd')),
                DragItem(name: '1')
              ]),
            ),
            Container(color: Colors.green, child: DraggableItemTarget())
          ],
        ));
  }
}
