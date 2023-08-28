import 'package:fantasy_draft/features/player_management/models/player.dart';

class TempRoster {
  static const int maxSize = 8;
  static Map<int, List<Player>> currentRoster = {};
  static Map<int, List<Player>> savedRoster = {};

  static Map<int, List<Player>> getRoster() {
    return currentRoster;
  }

  static saveCurrentRoster() {
    savedRoster = currentRoster
        .map((key, value) => MapEntry(key, List<Player>.from(value)));

    print('current:');
    currentRoster.forEach((key, value) {
      for (var p in value) {
        print('${p.first} ${p.last}');
      }
    });
  }

  static resetCurrentRoster() {
    currentRoster = savedRoster;
  }

  static resetSavedRoster() {
    print('saved roster reset');
    savedRoster = {};
  }

  static int getRosterSize() {
    int count = 0;
    currentRoster.forEach((key, value) {
      for (var p in value) {
        if (p.first != '') {
          count++;
        }
      }
    });

    return count;
  }

  static void updateRoster(Map<int, List<Player>> r) {
    print('update temp roster');
    currentRoster = r;
  }

  static void addToExtras(Player p) {
    currentRoster[8]!.add(p);
  }

  static void removeFromExtras() {
    for (int i = 0; i < currentRoster[8]!.length; i++) {
      if (currentRoster[8]![i].first == '') {
        currentRoster[8]!.removeAt(i);
      }
    }
  }
}
