
import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:flutter/material.dart';

class PlayerAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appScaffold(
        context,
        Column(
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                  flex: 2,
                  child: Container()
                  )
              ]),
            ),
           // Container(color: Colors.green, child: DraggableItemTarget(child: Container()))
          ],
        ),
        this);
  }
}
