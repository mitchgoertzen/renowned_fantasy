import 'package:flutter/material.dart';

import '../global_widgets/action_widget.dart';

Column buildButtonColumn(Color color, IconData icon, String label,
    Function(int? i) callback, int index) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ActionWidget(
        color: color,
        icon: icon,
        callback: callback,
        index: index,
      ),
      Container(
        margin: const EdgeInsets.only(top: 0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    ],
  );
}
