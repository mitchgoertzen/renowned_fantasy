import 'package:flutter/material.dart';

class ExpandableListItem extends StatefulWidget {
  const ExpandableListItem({super.key, required this.title, required this.body});
  final Widget title;
  final Widget body;
  @override
  State<ExpandableListItem> createState() => _ExpandableListItemState();
}

class _ExpandableListItemState extends State<ExpandableListItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: widget.title,
      children: [
        widget.body
      ],
      onExpansionChanged: (bool expanded) {
        setState(() {
          isExpanded = expanded;
        });
      },
    );
  }
}
