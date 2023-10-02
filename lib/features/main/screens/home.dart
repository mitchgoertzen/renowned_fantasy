import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:fantasy_draft/global_widgets/Card.dart';
import 'package:fantasy_draft/utils/shared_preference_utilities.dart';
import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //reset shared preference IDs
    SharedPreferencesUtilities.clearTemporaryData();
    //set current user ID
    SharedPreferencesUtilities.setCurrentUser();

    return appScaffold(
        context,
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigCard(first: 'home', second: 'screen'),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [SizedBox(width: 10)],
              ),
            ],
          ),
        ),
        this,
        null);
  }

//TODO: move to league settings class?
  static int getPositionMax(int pos) {
    int max = 1;

    switch (pos) {
      case 0:
      case 1:
        max = 4;
        break;
      case 7:
        max = 3;
    }
    return max;
  }
}
