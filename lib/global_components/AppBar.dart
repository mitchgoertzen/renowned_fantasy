import 'package:flutter/material.dart';

AppBar appBar(ThemeData theme){
  return AppBar(
    centerTitle: true,
    title: const Text(
      'Fantasy Draft',
    ),
    iconTheme: IconThemeData(color: theme.colorScheme.secondaryContainer),
    backgroundColor: theme.colorScheme.surfaceTint,
    foregroundColor: theme.colorScheme.secondaryContainer,
  );
}