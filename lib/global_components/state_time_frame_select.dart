import 'package:fantasy_draft/theme/theme.dart';
import 'package:flutter/material.dart';

class TimeRangeSelector extends StatefulWidget {
  const TimeRangeSelector(
      {super.key, required this.fullRange, required this.getTimeRange});

  final bool fullRange;
  final Function(int? range) getTimeRange;

  @override
  State<StatefulWidget> createState() => TimeRangeSelectorState();
}

class TimeRangeSelectorState extends State<TimeRangeSelector> {
  List<Widget> timeRanges = [];
  List<bool> selectedTimeRange = [];
// widget.

  @override
  void initState() {
    super.initState();
    timeRanges = [Text('Daily'), Text('Weekly')];
    selectedTimeRange = [false, true];
    if (widget.fullRange) {
      timeRanges.add(Text('Season'));
      selectedTimeRange.add(false);
    }
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
