import 'package:fantasy_draft/models/Matchup.dart';
import 'package:fantasy_draft/models/Team.dart';
import 'package:fantasy_draft/theme/theme.dart';
import 'package:fantasy_draft/utils/amplify_utilities.dart';
import 'package:fantasy_draft/utils/shared_preference_utilities.dart';
import 'package:flutter/material.dart';

categorySpan(TextSpan text, TextAlign align, bool winningTeam, int team) {
  Color highlightColour = Colors.white;
  BorderRadius borderRadius = BorderRadius.circular(5);
  if (winningTeam) {
    highlightColour = appDefaultTheme().primaryColorLight;
    if (team == 1) {
      borderRadius = BorderRadius.only(
          topLeft: Radius.circular(5), bottomLeft: Radius.circular(5));
    } else {
      borderRadius = BorderRadius.only(
          topRight: Radius.circular(5), bottomRight: Radius.circular(5));
    }
  }

  return WidgetSpan(
      child: Container(
          decoration:
              BoxDecoration(color: highlightColour, borderRadius: borderRadius),
          child: FractionallySizedBox(
            widthFactor: .35,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text.rich(
                text,
                textAlign: align,
              ),
            ),
          )));
}

statCategoryListing(String categoryLabel, var score1, var score2) {
  int padding1 = 1;
  int padding2 = 1;
  if (categoryLabel == 'OPS') {
    score1 = score1 as double;
    score2 = score2 as double;
    padding1 = 4;
    padding2 = 4;
  } else if (categoryLabel == 'ERA' || categoryLabel == 'WHIP') {
    score1 = score1 as double;
    score2 = score2 as double;
    padding1 = 3;
    padding2 = 3;
  } else {
    score1 = score1 as int;
    score2 = score2 as int;
    padding1 = score1.toString().length;
    padding2 = score2.toString().length;
  }
  //TODO: width equal to 'stat range button'
  const double boxSize = 85.0;

  int winningTeam = score1.compareTo(score2);

  return Padding(
    padding: const EdgeInsets.only(bottom: 2.0),
    child: Center(
      child: Container(
        color: Colors.black.withOpacity(0.01),
        child: Text.rich(TextSpan(children: [
          categorySpan(TextSpan(text: score1.toStringAsPrecision(padding1)),
              TextAlign.right, winningTeam == 1, 1),
          WidgetSpan(
              child: Container(
                  decoration: BoxDecoration(
                      color: (score1.compareTo(score2) != 0)
                          ? appDefaultTheme().primaryColorLight
                          : Colors.transparent,
                      borderRadius: (winningTeam == 1)
                          ? BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5))
                          : BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5))),
                  child: SizedBox(
                      width: boxSize,
                      child: Center(
                          child: Text.rich(
                        TextSpan(
                            text: categoryLabel,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ))))),
          categorySpan(TextSpan(text: score2.toStringAsPrecision(padding2)),
              TextAlign.left, winningTeam == -1, 2)
        ])),
      ),
    ),
  );
}

matchupResults(Matchup matchup, int timeRange) {
  late Map<String, dynamic> teamOneStats;
  late Map<String, dynamic> teamTwoStats;
  List<String> leagueStatCategories = ["NewField"];
  //await SharedPreferencesUtilities.getLeagueCategories();

  AmplifyUtilities.getTeamStats(matchup.teamOne!, timeRange)
      .then((value) => teamOneStats = value);

  AmplifyUtilities.getTeamStats(matchup.teamTwo!, timeRange)
      .then((value) => teamTwoStats = value);

  // teamOneStats =
  //     await AmplifyUtilities.getTeamStats(matchup.teamOne!, timeRange);
  // teamTwoStats =
  //     await AmplifyUtilities.getTeamStats(matchup.teamTwo!, timeRange);

  return Column(
    children: [
      // Text('extra batting stats dropdown? hits, avg, etc..'),
      for (String category in leagueStatCategories)
        statCategoryListing(
            category, teamOneStats[category], teamTwoStats[category]),

      //   Text('extra pitching stats dropdown? IP, etc..'),
      statCategoryListing('W', 0, 0),
      statCategoryListing('SV', 0, 0),
      statCategoryListing('K', 0, 0),
      statCategoryListing('ERA', 0.00, 0.00),
      statCategoryListing('WHIP', 0.00, 0.00),
    ],
  );
}
