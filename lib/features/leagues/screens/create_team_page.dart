import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fantasy_draft/models/ModelProvider.dart';
import 'package:fantasy_draft/utils/amplify_utilities.dart';
import 'package:fantasy_draft/utils/data_initializers.dart';
import 'package:fantasy_draft/utils/shared_preference_utilities.dart';
import 'package:flutter/material.dart';

class CreateTeam extends StatefulWidget {
  const CreateTeam({
    super.key,
    required this.refresh,
  });
  final Future<void> Function() refresh;

  @override
  State<StatefulWidget> createState() => CreateTeamState();
}

class CreateTeamState extends State<CreateTeam> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  late final String _nameText;

  @override
  void initState() {
    super.initState();

    _nameText = 'Create Team';
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<bool> submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    Manager? currentManager = await AmplifyUtilities.getCurrentManager();

    String currentLeagueID =
        await SharedPreferencesUtilities.getCurrentLeagueID();

    // If the form is valid, submit the data
    final name = nameController.text;

    // Create a new budget entry

    try {
      final teamRequest = ModelQueries.list(Team.classType);
      final teamResponse =
          await Amplify.API.query(request: teamRequest).response;

      // currentManager = await AmplifyUtilities.getCurrentManager();

      if (teamResponse.hasErrors) {
        safePrint('errors: ${teamResponse.errors}');
        return false;
      }

      final teamRoster = DataInitializers.initializeRoster();
      final teamRecord = Record(wins: 0, losses: 0, draws: 0, totalGames: 0);

      final newTeam = Team(
          name: name,
          manager: currentManager!.username,
          leagueID: currentLeagueID,
          record: teamRecord,
          roster: teamRoster);

      SharedPreferencesUtilities.setCurrentTeamID(newTeam.id);

      print('new team id: ${newTeam.id}');

      final request = ModelMutations.create(newTeam);
      await Amplify.API.mutate(request: request).response;

      //add team to league teams

      List<Team> updatedTeams;

      League? currentLeague = await AmplifyUtilities.getCurrentLeague();

      if (currentLeague!.teams != null) {
        print('league teams not null');
        updatedTeams = currentLeague.teams!;
        updatedTeams.add(newTeam);
      } else {
        print('league teams null');
        updatedTeams = [newTeam];
      }

      print('league teams: $updatedTeams');

      League updatedLeague = currentLeague.copyWith(teams: updatedTeams);
      ModelMutations.update(updatedLeague);

      //add team to managers teams

      if (currentManager.teams != null) {
        print('manager teams not null');
        updatedTeams = currentManager.teams!;
        updatedTeams.add(newTeam);
      } else {
        print('manager teams null');
        updatedTeams = [newTeam];
      }

      print('manager teams: $updatedTeams');

      Manager newManager = currentManager.copyWith(teams: updatedTeams);
      ModelMutations.update(newManager);

      // final managerRequest =
      //     ModelQueries.get(Manager.classType, currentManager.modelIdentifier);
      // final managerResponse = await Amplify.API.query(request: managerRequest).response;

      // final todo = managerResponse.data;

      // if (todo != null) {
      //   print('current managet username ${todo.username}');
      // }
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_nameText),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name (required)',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a team name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => submitForm().then((value) async => {
                            if (value)
                              {
                                await widget.refresh.call(),
                                Navigator.pop(context)
                              }
                          }),
                      child: Text(_nameText),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
