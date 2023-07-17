import 'package:flutter/material.dart';

class PlayerAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          ]);
  }
}
