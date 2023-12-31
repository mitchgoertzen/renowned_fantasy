import 'package:fantasy_draft/theme/theme.dart';
import 'package:flutter/material.dart';

Column sectionContainer(Widget child) {
  ThemeData theme = appDefaultTheme();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceVariant.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: theme.colorScheme.primary, width: 2))),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: child,
              ),
            ),
          ),
        ),
      ),
      // SizedBox(height: 5,)
    ],
  );
}
