import 'package:fantasy_draft/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomSelector extends StatefulWidget {
  const CustomSelector(
      {super.key,
      required this.getTimeRange,
      required this.options,
      required this.selectedIndex});

  final Function(int? range) getTimeRange;
  final List<String> options;
  final int selectedIndex;

  @override
  State<StatefulWidget> createState() => CustomSelectorState();
}

class CustomSelectorState extends State<CustomSelector> {
  List<Widget> timeRanges = [];
  List<bool> selectedTimeRange = [];
// widget.

  @override
  void initState() {
    super.initState();
    for (var element in widget.options) {
      timeRanges.add(Text(element));
      selectedTimeRange.add(false);
    }
    selectedTimeRange[widget.selectedIndex] = true;
  }

  ThemeData theme = appDefaultTheme();

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (int index) {
        widget.getTimeRange(index);
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < selectedTimeRange.length; i++) {
            selectedTimeRange[i] = i == index;
          }
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: theme.colorScheme.secondaryContainer,
      selectedColor: theme.colorScheme.primary,
      fillColor: theme.colorScheme.surfaceVariant,
      color: theme.colorScheme.surfaceVariant,
      constraints: const BoxConstraints(
        minHeight: 20.0,
        minWidth: 75.0,
      ),
      isSelected: selectedTimeRange,
      children: timeRanges,
    );
  }
}
