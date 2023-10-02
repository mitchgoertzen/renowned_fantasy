import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fantasy_draft/features/leagues/components/fantasy_league_tab.dart';
import 'package:fantasy_draft/features/leagues/screens/matchup_page.dart';
import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:fantasy_draft/models/Manager.dart';
import 'package:fantasy_draft/models/Matchup.dart';
import 'package:fantasy_draft/models/Team.dart';
import 'package:fantasy_draft/utils/amplify_utilities.dart';
import 'package:fantasy_draft/utils/shared_preference_utilities.dart';
import 'package:fantasy_draft/utils/temp_data.dart';
import 'package:flutter/material.dart';
import '../screens/fantasy_league_page.dart';
import '../screens/sports_league_page.dart';
import '../screens/fantasy_team_page.dart';

class FantasyLeagueHome extends StatefulWidget {
  @override
  State<FantasyLeagueHome> createState() => _FantasyLeagueHomeState();
}

class _FantasyLeagueHomeState extends State<FantasyLeagueHome>
    with SingleTickerProviderStateMixin {
  bool _isInAsyncCall = true;
  int _pageIndex = 0;
  int leagueWeek = 0;
  Team currentTeam = Team(name: '', manager: '', leagueID: '');

  List<Matchup> leagueMatchups = [];
  //TODO: init matchup
  Matchup activeMatchup = Matchup();

  List<int> tabStack = [0];

  late String teamID;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    teamID = '';
    setCurrentTeam();
    setLeagueWeek();
    super.initState();
  }

  //nav keys for each tab, so they may have individual stacks
  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
  };

  void _selectPage(int index) {
    //TODO: if current tab is MLB and addPage is open (find better way to check this)
    if (_pageIndex == 3 && TempData.getTempRoster().catcher.isNotEmpty) {
      resetAddPlayer();
    }
    setState(() {
      _pageIndex = index;
    });

    //new page index already in stack
    if (tabStack.contains(_pageIndex)) {
      if (_pageIndex == 0) {
        tabStack = [0];
      } else {
        if (tabStack.length > 1) {
          //remove index
          tabStack.remove(_pageIndex);
          //push to top of stack
          tabStack.add(_pageIndex);
        }
      }
    } else {
      //push to top of stack
      tabStack.add(_pageIndex);
    }

    _tabController.animateTo(index);
  }

  Future<bool> _onWillPop() async {
    if (Navigator.canPop(navigatorKeys[_pageIndex]!.currentState!.context)) {
      //TODO: change check
      if (_pageIndex == 3 && TempData.getTempRoster().catcher.isEmpty) {
        resetAddPlayer();
        Navigator.pop(navigatorKeys[_pageIndex]!.currentState!.context, true);
      } else {
        Navigator.pop(navigatorKeys[_pageIndex]!.currentState!.context);
      }

      return false;
    } else {
      if (tabStack.length == 1) {
        if (_pageIndex != 0) {
          //stack is [1 || 2 || 3]
          tabStack.removeLast();
          _selectPage(0);
        } else {
          return true;
        }
      } else {
        //stack is > 1
        tabStack.removeLast();
        _selectPage(tabStack.last);
      }
      return false;
    }
  }

  _tabItem(IconData icon, String label) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon),
      Text(
        label,
        style: TextStyle(fontSize: 12),
      ),
    ]);
  }

  void resetAddPlayer() {
    //reset saved roster to {}
    TempData.clearTempRoster();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return appScaffold(
        context,
        SafeArea(
          child: WillPopScope(
            onWillPop: _onWillPop,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                FantasyLeagueTab(
                  navigatorKey: navigatorKeys[0]!,
                  child: FantasyTeamPage(
                    currentTeam: currentTeam,
                    teamID: teamID,
                    isInAsyncCall: _isInAsyncCall,
                    updateTeam: () => setCurrentTeam(),
                  ),
                ),
                FantasyLeagueTab(
                  navigatorKey: navigatorKeys[1]!,
                  child: MatchupPage(matchup: activeMatchup),
                ),
                FantasyLeagueTab(
                  navigatorKey: navigatorKeys[2]!,
                  child: FantasyLeaguePage(leagueMatchups: leagueMatchups),
                ),
                FantasyLeagueTab(
                  navigatorKey: navigatorKeys[3]!,
                  child: SportsLeaguePage(
                    pop: () => {
                      Navigator.of(
                              navigatorKeys[_pageIndex]!.currentState!.context)
                          .pop(),

                      //TODO: show small popup for player added. fade out after some time
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        widget,
        FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.09,
          child: TabBar(
            labelColor: theme.primaryColor,
            unselectedLabelColor: theme.disabledColor,
            indicatorColor: Colors.transparent,
            onTap: _selectPage,
            tabs: [
              _tabItem(Icons.people_alt_sharp, 'My Team'),
              _tabItem(Icons.compare_arrows_sharp, 'Matchup'),
              _tabItem(Icons.format_list_numbered_rounded, 'League'),
              _tabItem(Icons.sports_baseball_sharp, 'MLB'),
            ],
            controller: _tabController,
          ),
        ));
  }

  void setCurrentTeam() async {
    print('SET TEAM');
    String leagueID = await SharedPreferencesUtilities.getCurrentLeagueID();
    Manager? manager = await AmplifyUtilities.getCurrentManager();
    String currentUser = manager!.username;

    try {
      final teamsRequest =
          ModelQueries.list(Team.classType, where: Team.LEAGUEID.eq(leagueID));
      final teamsResponse =
          await Amplify.API.query(request: teamsRequest).response;
      final teamsInLeague = teamsResponse.data?.items;

      //1 or more teams in the league
      if (teamsInLeague!.isNotEmpty) {
        Iterable<Team?> currentUsersTeam =
            teamsInLeague.where((element) => element!.manager == currentUser);

        //current user has a team in current league
        if (currentUsersTeam.isNotEmpty) {
          SharedPreferencesUtilities.setCurrentTeamID(
              currentUsersTeam.first!.id);

          setState(() {
            teamID = currentUsersTeam.first!.id;
            currentTeam = currentUsersTeam.first!;
            TempData.setTempRoster(currentTeam.roster!);
          });
        }
      }

      setState(() {
        _isInAsyncCall = false;
      });

      if (teamsResponse.hasErrors) {
        safePrint('errors: ${teamsResponse.errors}');
        return;
      }
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

//TODO:
  void setLeagueWeek() async {
    int week = await SharedPreferencesUtilities.getCurrentWeek();
    setState(() {
      leagueWeek = week;
    });
  }

  setMatchups() async {
    setState(() {});
  }
}
