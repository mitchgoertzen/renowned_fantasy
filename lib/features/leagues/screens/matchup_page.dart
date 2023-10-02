import 'dart:ffi';
import 'package:fantasy_draft/features/leagues/components/matchup_results.dart';
import 'package:fantasy_draft/global_components/section_container.dart';
import 'package:fantasy_draft/global_components/state_time_frame_select.dart';
import 'package:fantasy_draft/models/Matchup.dart';
import 'package:fantasy_draft/models/Team.dart';
import 'package:fantasy_draft/theme/theme.dart';
import 'package:fantasy_draft/utils/amplify_utilities.dart';
import 'package:fantasy_draft/utils/temp_data.dart';
import 'package:fantasy_draft/utils/utilities.dart';
import 'package:flutter/material.dart';

//stateless
class MatchupPage extends StatefulWidget {
  const MatchupPage({super.key, required this.matchup});

  final Matchup matchup;

  @override
  State<StatefulWidget> createState() => MatchupPageState();
}

class MatchupPageState extends State<MatchupPage> {
  ThemeData theme = appDefaultTheme();

  late Team teamOne;
  late Team teamTwo;
  List<int> scores = [0, 0];

  @override
  void initState() {
    String leagueID = "--";
    if (TempData.seasonStarted) {
      setMatchupTeams(timeRange);
    } else {
      teamOne = Team(name: "1", manager: "None", leagueID: leagueID);
      teamTwo = Team(name: "2", manager: "None", leagueID: leagueID);
    }
    super.initState();
  }

  //0 daily, 1 weekly, 2 season
  //TODO: save time range for each app use?
  int timeRange = 1;

  void updateTimeRange(int r) {
    setState(() {
      timeRange = r;
    });
  }

  teamHeader(String logo, String name, int score) {
    return Column(children: [
      Container(
        width: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: theme.colorScheme.primary.withOpacity(0.25),
            width: 2.0,
          ),
        ),
        child: ClipOval(
            child: Icon(
          size: 60,
          Icons.person_2,
        )
            // Image.asset(
            //   'assets/images/$logo',
            //   width: 60,
            //   height: 60,
            //   fit: BoxFit.fitHeight,
            // ),
            ),
      ),
      Text(name),
      Text.rich(
        TextSpan(
            text: '$score',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          //TODO: calculate score once
          teamHeader('A.jpg', teamOne.name, scores[0]),
          teamHeader('B.png', teamTwo.name, scores[1])
        ]),
        Center(
            child: TimeRangeSelector(
          fullRange: true,
          getTimeRange: (int? range) => updateTimeRange(range!),
        )),
        sectionContainer(matchupResults(widget.matchup, timeRange)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            //TODO: universal action button
            SizedBox(
              width: 80,
              height: 40,
              child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          theme.colorScheme.primary),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          theme.colorScheme.inversePrimary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color:
                                      theme.colorScheme.tertiaryContainer)))),
                  onPressed: () => Void,
                  child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                      'Live View')),
            ),
            SizedBox(
              width: 80,
              height: 40,
              child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          theme.colorScheme.primary),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          theme.colorScheme.inversePrimary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color:
                                      theme.colorScheme.tertiaryContainer)))),
                  onPressed: () => Void,
                  child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                      'Live View')),
            ),
          ]),
        )
      ],
    );
  }

//TODO:
  setMatchupTeams(int timeRange) async {
    print(widget.matchup.teamOne);
    print(widget.matchup.teamTwo);
    Team? t1 = await AmplifyUtilities.getTeam(widget.matchup.teamOne!);
    Team? t2 = await AmplifyUtilities.getTeam(widget.matchup.teamTwo!);

    setState(() {
      teamOne = t1!;
      teamTwo = t2!;
      scores = calculateMatchupScores(t1.battingStats![timeRange].toJson(),
          t2.battingStats![timeRange].toJson());
    });
  }
}
