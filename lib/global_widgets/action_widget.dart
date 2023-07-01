import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget(
      {Key? key,
      required this.color,
      required this.icon,
      required this.callback,
      required this.index})
      : super(key: key);

  final IconData icon;
  final Color color;
  final Function(int? i) callback;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(icon, color: color), onPressed: () => callback(index));
  }
}
