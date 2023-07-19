import 'package:fantasy_draft/features/player_management/models/player.dart';

class TempAvailPlayers{


  TempAvailPlayers(){
    availPlayers.add(Player('Player', '12', ['C', 'OF']));
    availPlayers.add(Player('Player', '13', ['2B', 'SS']));
    availPlayers.add(Player('Player', '14', ['OF']));
    availPlayers.add(Player('Player', '15', ['3B', 'OF']));
    availPlayers.add(Player('Player', '16', ['SP', 'RP']));
    availPlayers.add(Player('Player', '17', ['SP', 'RP']));
  }

 static List<Player> availPlayers = [];


  static List<Player> getAvailPlayers(){
    return availPlayers;
  }

}