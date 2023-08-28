import 'package:fantasy_draft/features/leagues/components/matchup_results.dart';
import 'package:fantasy_draft/features/leagues/components/standings.dart';
import 'package:fantasy_draft/features/leagues/models/matchup.dart';
import 'package:fantasy_draft/features/leagues/models/temp_fantasy_league.dart';
import 'package:fantasy_draft/global_components/expandable_list_item.dart';
import 'package:fantasy_draft/global_components/section_container.dart';
import 'package:fantasy_draft/theme/theme.dart';
import 'package:flutter/material.dart';

class FantasyLeaguePage extends StatelessWidget {
  const FantasyLeaguePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = appDefaultTheme();

    matchupListing(Matchup currentMatchup) {
      List<int> matchupScore = currentMatchup.calculateScore();
      return ExpandableListItem(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.25),
                    width: 2.0,
                  ),
                ),
                child: ClipOval(child: Icon(size: 30, Icons.person_2)
                    // Image.asset(
                    //   'assets/images/A.jpg',
                    //   width: 30,
                    //   height: 30,
                    //   fit: BoxFit.fitHeight,
                    // ),
                    ),
              ),
              Text(currentMatchup.teamA.getName()),
              Text(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  '${matchupScore[0]}'),
              SizedBox(
                width: 5,
              ),
              Text(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  '${matchupScore[1]}'),
              Text(currentMatchup.teamB.getName()),
              Container(
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.25),
                    width: 2.0,
                  ),
                ),
                child: ClipOval(child: Icon(size: 30, Icons.person_2)
                    // Image.asset(
                    //   'assets/images/B.png',
                    //   width: 30,
                    //   height: 30,
                    //   fit: BoxFit.fitHeight,
                    // ),
                    ),
              ),
            ],
          ),
          body: Row(
            children: [
              SizedBox(
                width: 325,
                child: matchupResults(currentMatchup, 1),
              ),
              SizedBox()
            ],
          ));
    }

    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        sectionContainer(Column(
          children: [titleHeader('Standings'), leagueStandings()],
        )),
        SizedBox(
          height: 10,
        ),
        sectionContainer(Column(
          children: [
            titleHeader('Live Matchups'),
            for (var m in TempFantasyLeague.getMatchups()) matchupListing(m),
          ],
        ))
      ],
    );
  }

  titleHeader(String title) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: appDefaultTheme().dividerColor,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                title)));
  }
}
