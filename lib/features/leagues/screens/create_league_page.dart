import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fantasy_draft/models/ModelProvider.dart';
import 'package:fantasy_draft/utils/amplify_utilities.dart';
import 'package:flutter/material.dart';

class CreateLeague extends StatefulWidget {
  const CreateLeague({
    super.key,
    required this.refresh,
  });
  final Future<void> Function() refresh;

  @override
  State<CreateLeague> createState() => _CreateLeagueState();
}

class _CreateLeagueState extends State<CreateLeague> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController leagueNameController = TextEditingController();

  late final String _titleText;

  @override
  void initState() {
    super.initState();
    _titleText = 'Create League';
  }

  @override
  void dispose() {
    leagueNameController.dispose();
    super.dispose();
  }

  Future<bool> submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    Manager? currentManager;

    final leagueName = leagueNameController.text;

    try {
      final leagueRequest = ModelQueries.list(League.classType);
      final leagueResponse =
          await Amplify.API.query(request: leagueRequest).response;

      currentManager = await AmplifyUtilities.getCurrentManager();

      if (leagueResponse.hasErrors) {
        safePrint('errors: ${leagueResponse.errors}');
        return false;
      }

      final newLeague = League(
        name: leagueName,
        creationDate: TemporalDate(DateTime.now()),
        owner: currentManager!.username,
      );

      //create new league and add to db
      final request = ModelMutations.create(newLeague);
      await Amplify.API.mutate(request: request).response;

      final newLeagueManager =
          LeagueManager(league: newLeague, manager: currentManager);

      //create league-manager relation and add to db
      //since league is new, the only relation is current manager to new league
      final leagueManagerRequest = ModelMutations.create(newLeagueManager);
      await Amplify.API.mutate(request: leagueManagerRequest).response;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
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
                      controller: leagueNameController,
                      decoration: const InputDecoration(
                        labelText: 'League Name (required)',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name for your league';
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
                      child: Text(_titleText),
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
