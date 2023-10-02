import 'package:fantasy_draft/models/BattingStats.dart';
import 'package:fantasy_draft/models/ModelProvider.dart';
import 'package:fantasy_draft/models/Roster.dart';

class DataInitializers {
  static Roster initializeRoster() {
    Roster r = Roster(
        size: 0,
        catcher: [],
        firstBase: [],
        secondBase: [],
        thirdBase: [],
        shortStop: [],
        outfielders: [],
        startingPitchers: [],
        reliefPitchers: [],
        bench: []);
    return r;
  }

  static BattingStats initializeBattingStats() {
    BattingStats b = BattingStats();
    return b;
  }

  static PitchingStats initializePitchingStats() {
    PitchingStats p = PitchingStats();
    return p;
  }
  // Roster initializeRoster(){
  //   Roster r = Roster();
  //   return r;
  // }
}
