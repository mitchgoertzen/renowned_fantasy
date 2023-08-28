import 'package:fantasy_draft/features/player_management/models/player.dart';

class TempAvailPlayers{

  static List<Player> availablePlayers = [];


  static List<Player> getAvailPlayers(){
    return availablePlayers;
  }

  static void addPlayer(Player p){
    availablePlayers.add(p);
  }

  static void removePlayer(Player p){
    availablePlayers.remove(p);
  }

}