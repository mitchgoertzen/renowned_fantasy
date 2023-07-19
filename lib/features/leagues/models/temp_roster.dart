import 'dart:developer';

import 'package:fantasy_draft/features/player_management/models/player.dart';

class TempRoster {
  static Map<int, List<Player>> currentRoster = {};




  TempRoster() {


    //SS
    //OF
    //OF
    //OF
    // Player('Player', '11', ['1B, 2B, 3B'])   //EX
    // Player('Player', '9', ['SP'])
    // Player('Player', '10', ['SP, RP'])
  }

  static Map<int, List<Player>> getRoster() {
    return currentRoster;
  }

  static void updateRoster(Map<int, List<Player>> r){
    currentRoster = r;
  }

  static void addToBench(Player p) {
    currentRoster[8]!.add(p);
  }

  static void removeFromBench(Player p){
    currentRoster[8]!.remove(p);
    print(currentRoster[8]!.length);
  }


}
