import 'fantasy_team.dart';

class FantasyLeagueManager {
  String _name;
  String _email;

  List<FantasyTeam> _teams = [];

  FantasyLeagueManager(this._name, this._email);

  void editName(String newName) {
    _name = newName;
  }

  String getName() {
    return _name;
  }

  void editEmail(String newEmail) {
    _email = newEmail;
  }

  String getEmail() {
    return _email;
  }

  void addTeam(FantasyTeam newTeam) {
    _teams.add(newTeam);
  }

  List<FantasyTeam> getTeams() {
    return _teams;
  }
}
