import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fantasy_draft/features/leagues/components/fantasy_league_home.dart';
import 'package:fantasy_draft/features/leagues/screens/create_league_page.dart';
import 'package:fantasy_draft/global_components/app_scaffold.dart';
import 'package:fantasy_draft/models/ModelProvider.dart';
import 'package:fantasy_draft/utils/navigation_animation.dart';
import 'package:fantasy_draft/utils/shared_preference_utilities.dart';
import 'package:fantasy_draft/utils/utilities.dart';
import 'package:flutter/material.dart';

class LeagueDirectory extends StatefulWidget {
  const LeagueDirectory({super.key});

  @override
  State<StatefulWidget> createState() => LeagueDirectoryState();
}

class LeagueDirectoryState extends State<LeagueDirectory> {
  List<int> _leageMemberCounts = [];
  List<League> _leagues = [];
  //TODO: get directly from league-manager relation

  bool _isInAsyncCall = false;

  @override
  void initState() {
    super.initState();
    _refreshLeagues();
  }

  Future<void> _refreshLeagues() async {
    print('refresh leagues');

    setState(() {
      _isInAsyncCall = true;
    });

    try {
      final currentManager =
          await SharedPreferencesUtilities.getCurrentManager();
      print('current manager: $currentManager');
      //TODO: show all leagues manager is a part of, not just owner of
      final request = ModelQueries.list(League.classType,
          where: League.OWNER.eq(currentManager));
      final response = await Amplify.API.query(request: request).response;

      final todos = response.data?.items;
      List<int> memberCounts = [];

      for (var t in todos!) {
        final rq = ModelQueries.list(LeagueManager.classType,
            where: LeagueManager.LEAGUE.eq(t!.id));
        final rs = await Amplify.API.query(request: rq).response;

        final managers = rs.data?.items;

        memberCounts.add(managers!.length);
      }
      if (response.hasErrors) {
        safePrint('errors: ${response.errors}');
        return;
      }
      setState(() {
        _leagues = todos.whereType<League>().toList();
        _leageMemberCounts = memberCounts;
        _isInAsyncCall = false;
      });
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

  Future<void> _deleteLeague(League league) async {
    final request = ModelMutations.delete<League>(league);
    final response = await Amplify.API.mutate(request: request).response;
    safePrint('Delete response: $response');
    await _refreshLeagues();
  }

  Future<void> _navigateToCreateLeague() async {
    Navigator.of(context).push(NavigationAnimation.createRoute(
      CreateLeague(
        refresh: _refreshLeagues,
      ),
    ));
  }

  Future<void> _navigateToLeague({League? league}) async {
    print('go to league');
    print('league id: ${league!.id}');
    print('league name: ${league.name}');
    print('league: $league');
    SharedPreferencesUtilities.setCurrentLeagueID(league.id);
    Navigator.of(context)
        .push(NavigationAnimation.createRoute(FantasyLeagueHome()));
  }

  Widget _buildRow({
    required String name,
    required String owner,
    required String managerCount,
    required String dateCreated,
    TextStyle? style,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
        Expanded(
          child: Text(
            owner,
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
        Expanded(
          child: Text(
            managerCount,
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
        Expanded(
          child: Text(
            dateCreated,
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
      ],
    );
  }

  //TODO: create class variables for elements that vary with current team
  @override
  Widget build(BuildContext context) {
    return appScaffold(
        context,
        _isInAsyncCall
            ? CircularProgressIndicator()
            : Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: RefreshIndicator(
                    onRefresh: _refreshLeagues,
                    child: Column(
                      children: [
                        if (_leagues.isEmpty)
                          Text(
                              textAlign: TextAlign.center,
                              'You aren\'t apart of any leagues. \nCreate one yourself or join someone else\'s')
                        else
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Your Leagues',
                                style: const TextStyle(fontSize: 24),
                              )
                            ],
                          ),
                        const SizedBox(height: 30),
                        _buildRow(
                          name: 'Title',
                          owner: 'Owner',
                          managerCount: 'Managers',
                          dateCreated: 'Date Created',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Divider(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _leagues.length,
                            itemBuilder: (context, index) {
                              final league = _leagues[index];
                              return Dismissible(
                                key: ValueKey(league),
                                background: const ColoredBox(
                                  color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.delete,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                onDismissed: (_) => _deleteLeague(league),
                                child: ListTile(
                                  onTap: () => _navigateToLeague(
                                    league: league,
                                  ),
                                  title: _buildRow(
                                      name: league.name,
                                      owner: league.owner!,
                                      managerCount:
                                          _leageMemberCounts[index].toString(),
                                      dateCreated: getDate(league.createdAt!)
                                          .toString()),
                                ),
                              );
                            },
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: _navigateToCreateLeague,
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        widget,
        null);
  }
}
