import 'package:nucleartension/domain/models/game.dart';
import 'package:nucleartension/domain/models/players/self_player.dart';
import 'package:nucleartension/domain/models/region.dart';
import 'package:nucleartension/domain/models/research.dart';
import 'package:nucleartension/domain/types/country.dart';
import 'package:nucleartension/domain/types/research_type.dart';

class Player {
  final Game game;
  final String name;
  final Country country;
  final Map<ResearchType, Research> researches;
  int energy;

  Player({
    required this.game,
    required this.name,
    required this.country,
    required this.researches,
    required this.energy,
  });

  bool get isSelf => this is SelfPlayer;

  bool get isAlive => true; //population > 0;

  // ============================= REGIONS ================================== \\

  List<Region> get regions => game.battlefield.playerRegions(this);

  // ============================ RESEARCH ================================== \\

  int get researchLevel {
    int result = 0;

    for (final Research research in researches.values) {
      result += research.level;
    }

    return result;
  }

  bool get hasIntel {
    final int researchIntelPopulation = game.self
        .getResearch(ResearchType.intel_population)
        .level;
    final int researchIntelMissiles = game.self
        .getResearch(ResearchType.intel_missiles)
        .level;

    return (researchIntelPopulation > 0) || (researchIntelMissiles > 0);
  }

  Research getResearch(ResearchType researchType) =>
      researches[researchType] ??
      Research(player: this, level: 0, researchType: researchType);

  void addResearches(List<Research> list) {
    for (final Research research in list) {
      researches[research.researchType] = research;
    }
  }

  // ============================ MISSILES ================================== \\

  /*void removeDefenseMissiles(int value) =>
      military.remove(MilitaryType.missile_defense, value);

  void removeAttackMissiles(int value) =>
      military.remove(MilitaryType.missile_attack, value);

  int get defenseMissiles => military.get(MilitaryType.missile_defense).toInt();

  int get attackMissiles => military.get(MilitaryType.missile_attack).toInt();

  int get amountOfMissiles => defenseMissiles + attackMissiles;

  bool get hasAttackMissiles => attackMissiles > 0;*/

  int get attackMissileYield {
    final Research research = getResearch(ResearchType.missiles_nuclear_bomb);

    return Research.yield(research.level);
  }

  num get defenseMissilesEffectiveness {
    final Research research = getResearch(
      ResearchType.missiles_active_tracking,
    );

    return research.increaseRate;
  }

  num get attackMissilesEffectiveness {
    final Research research = getResearch(ResearchType.missiles_signal_jamming);

    return research.decreaseRate;
  }

  num get missileAttackWarningWhenDefending {
    final Research research = getResearch(
      ResearchType.warning_missiles_radar_network,
    );

    return research.increaseRate;
  }

  num get missileAttackWarningWhenAttacking {
    final Research research = getResearch(
      ResearchType.warning_missiles_hypersonic_propulsion,
    );

    return research.decreaseRate;
  }

  // ============================= UPDATE =================================== \\

  void update(double dt) {
    if (isAlive) {
      researches.values.forEach((e) => e.update(dt));
      takeAction();
    }
  }

  void takeAction() {}
}
