import 'dart:ffi';
import 'package:fantasy_draft/features/leagues/components/roster.dart';
import 'package:fantasy_draft/features/leagues/models/fantasy_team.dart';
import 'package:fantasy_draft/features/leagues/models/temp_roster.dart';
import 'package:fantasy_draft/features/leagues/screens/create_team_page.dart';
import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/global_components/section_container.dart';
import 'package:fantasy_draft/managers/player_drag_manager.dart';
import 'package:fantasy_draft/models/Team.dart';
import 'package:fantasy_draft/theme/theme.dart';
import 'package:fantasy_draft/utils/navigation_animation.dart';
import 'package:flutter/material.dart';

class FantasyTeamPage extends StatefulWidget {
  const FantasyTeamPage(
      {super.key,
      required this.team,
      required this.teamID,
      required this.isInAsyncCall,
      required this.updateTeam});

  final FantasyTeam team;
  final String teamID;
  final bool isInAsyncCall;
  final Function updateTeam;

  @override
  State<FantasyTeamPage> createState() => _FantasyTeamPageState();
}

class _FantasyTeamPageState extends State<FantasyTeamPage> {
  late Team myTeam;

  @override
  void initState() {
    super.initState();

    _refresh();

    myRoster = Roster(
      updateRoster: (Roster? r) => updateRoster(r!),
      roster: widget.team.getRoster(),
      removePlayerFromExtra: (Player? p) => removePlayerFromExtras(p!),
      reassignDisplacedPlayer: (Player? p, String? o) => addPlayerToExtras(p!),
      dragManager: dragManager,
      recentPlayerAccepted: (bool? b) => Void,
      extraPlayers: TempRoster.getRoster()[8]!,
    );
  }

  TempRoster temp = TempRoster();

  late Roster myRoster;

  late PlayerDragManager dragManager;

  ThemeData theme = appDefaultTheme();

  _FantasyTeamPageState() {
    dragManager = PlayerDragManager();
  }

  void updateRoster(Roster r) {
    TempRoster.updateRoster(myRoster.getRoster());
    setState(() {
      myRoster = r;
    });
  }

//if player is already in target --> move that player to playerList
  void removePlayerFromExtras(Player p) {
    print('REMOVE PLAYER');
    TempRoster.removeFromExtras();
  }

  void addPlayerToExtras(Player p) {
    print('ADD PLAYER');
    TempRoster.addToExtras(p);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isInAsyncCall
        ? CircularProgressIndicator()
        : RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: SizedBox(
                    height: 125,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: theme.colorScheme.primary
                                                  .withOpacity(0.25),
                                              width: 2.0,
                                            )),
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
                                            )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                        'Team A'),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('interaction buttons up here'),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text('1st Place : 75-31-5'),
                                  ),
                                ],
                              )
                            ])),
                  ),
                ),
                if (widget.teamID != '')
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(child: sectionContainer(myRoster)))
                else
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: FloatingActionButton(
                      // Navigate to the page to create new budget entries
                      onPressed: _navigateToCreateTeam,
                      child: const Icon(Icons.add),
                    ),
                  )
              ],
            ),
          );
  }

  Future<void> _refresh() async {
    print('refresh');
    widget.updateTeam();
  }

  Future<void> _navigateToCreateTeam() async {
    Navigator.of(context).push(NavigationAnimation.createRoute(
      CreateTeam(
        refresh: _refresh,
      ),
    ));
  }
}
