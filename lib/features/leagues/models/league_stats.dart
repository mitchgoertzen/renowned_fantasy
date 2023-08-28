import 'dart:math';

class FantasyStats {
  int plateAppearances = 0;
  int atBats = 0;
  int hits = 0;
  int singles = 0;
  int doubles = 0;
  int triples = 0;
  int homeRuns = 0;
  int runs = 0;
  int runsBattedIn = 0;
  int walks = 0;
  int stolenBases = 0;

  FantasyStats();

  void reset() {
    plateAppearances = 0;
    atBats = 0;
    hits = 0;
    singles = 0;
    doubles = 0;
    triples = 0;
    homeRuns = 0;
    runs = 0;
    runsBattedIn = 0;
    walks = 0;
    stolenBases = 0;
  }

  double getAverage() {
    return hits / max(atBats, 1);
  }

  double getOnBasePercentage() {
    return (hits + walks) / max(1, plateAppearances);
  }

  double getSlugging() {
    return (singles + 2 * doubles + 3 * triples + 4 * homeRuns) /
        max(1, atBats);
  }

  double getOPS() {
    return getOnBasePercentage() + getSlugging();
  }

  Map<String, dynamic> getStats(List<String> categories) {
    Map<String, dynamic> stats = {};

    for (String c in categories) {
      switch (c) {
        case 'plateAppearance':
          stats[c] = plateAppearances;
          break;
        case 'atBat':
          stats[c] = atBats;
          break;
        case 'hit':
          stats[c] = hits;
          break;
        case 'single':
          stats[c] = singles;
          break;
        case 'double':
          stats[c] = doubles;
          break;
        case 'triple':
          stats[c] = triples;
          break;
        case 'HR':
          stats[c] = homeRuns;
          break;
        case 'walk':
          stats[c] = walks;
          break;
        case 'R':
          stats[c] = runs;
          break;
        case 'RBI':
          stats[c] = runsBattedIn;
          break;
        case 'SB':
          stats[c] = stolenBases;
          break;
        case 'OPS':
          stats[c] = getOPS();
          break;
        default:

        // case 'hit': hits += e.value as int;
        // break;
        // case 'hit': hits += e.value as int;
        // break;
        // case 'hit': hits += e.value as int;
        // break;
        // case 'hit': hits += e.value as int;
        // break;
      }
    }
    return stats;
  }

  void addStats(Map<String, int> newStats) {
    for (var e in newStats.entries) {
      switch (e.key) {
        case 'plateAppearance':
          plateAppearances += e.value;
          break;
        case 'atBat':
          atBats += e.value;
          break;
        case 'hit':
          hits += e.value;
          break;
        case 'single':
          singles += e.value;
          break;
        case 'double':
          doubles += e.value;
          break;
        case 'triple':
          triples += e.value;
          break;
        case 'homeRun':
          homeRuns += e.value;
          break;
        case 'walk':
          walks += e.value;
          break;
        case 'run':
          runs += e.value;
          break;
        case 'rbi':
          runsBattedIn += e.value;
          break;
        case 'stolenBase':
          stolenBases += e.value;
          break;
        default:
          break;
        // case 'hit': hits += e.value as int;
        // break;
        // case 'hit': hits += e.value as int;
        // break;
        // case 'hit': hits += e.value as int;
        // break;
        // case 'hit': hits += e.value as int;
        // break;
      }
    }
  }

  getStatByCatgeory() {}
}
