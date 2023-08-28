import 'package:fantasy_draft/theme/theme.dart';
import 'package:flutter/material.dart';

AppBar draftAppBar(ThemeData theme){
  return AppBar(
    centerTitle: true,
    title: const Text(
      'Fantasy Draft',
    ),
    iconTheme: IconThemeData(color: theme.colorScheme.secondaryContainer),
    backgroundColor: appDefaultTheme().primaryColor,
    foregroundColor: theme.colorScheme.secondaryContainer,
  );
}