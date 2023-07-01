import 'package:fantasy_draft/utils/Utilities.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.first,
    required this.second,
  });

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.secondary,
    );
    return Card(
      color: theme.colorScheme.primaryContainer,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text("${capitalize(first)} ${capitalize(second)}", style: style),
      ),
    );
  }
}