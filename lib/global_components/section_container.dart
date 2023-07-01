import 'package:fantasy_draft/theme/theme.dart';
import 'package:flutter/material.dart';

Column sectionContainer(Widget child) {
  ThemeData theme = appDefaultTheme();

  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: theme.colorScheme.primary, width: 2))),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: child,
            ),
          ),
        ),
      ),
      // SizedBox(height: 5,)
    ],
  );
}
