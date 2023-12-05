import "dart:math";

import 'models.dart';

class Turn {
  final int turnNumber;
  final FighterModel attacker;
  final FighterModel defender;
  final List<String> log;

  Turn({
    required this.turnNumber,
    required this.attacker,
    required this.defender,
    required this.log,
  });

  void resolveTurn() {
    StatModel healthStat =
        StatModel.getStats().firstWhere((stat) => stat.name == 'Health');
    StatModel strengthStat =
        StatModel.getStats().firstWhere((stat) => stat.name == 'Strength');
    StatModel speedStat =
        StatModel.getStats().firstWhere((stat) => stat.name == 'Speed');
    StatModel critStat =
        StatModel.getStats().firstWhere((stat) => stat.name == 'Crit');
    StatModel dodgeStat =
        StatModel.getStats().firstWhere((stat) => stat.name == 'Dodge');
    StatModel defenseStat =
        StatModel.getStats().firstWhere((stat) => stat.name == 'Defense');

    Map<StatModel, int> attackerStats = attacker.stats;
    Map<StatModel, int> defenderStats = defender.stats;

    final crit = attackerStats[critStat]! / 100;
    final hasCrit = Random().nextDouble() <= crit;
    int damage = 0;

    final hasHit = Random().nextDouble() <=
        (defenderStats[dodgeStat]! / 100) - (attackerStats[speedStat]! / 100);

    if (!hasHit) {
      log.add('${attacker.name} tries to attack but missed!');
      return;
    }

    if (hasCrit) {
      damage = attackerStats[strengthStat]! * attackerStats[speedStat]! * 2 -
          defenderStats[defenseStat]!;
    } else {
      damage = attackerStats[strengthStat]! * attackerStats[speedStat]! -
          defenderStats[defenseStat]!;
    }
    if (damage < 0) {
      log.add('${attacker.name} tries to attack but ${defender.name} blocks!');
      return;
    }

    defenderStats[healthStat] = defenderStats[healthStat]! - damage;
    log.add(
        '${hasCrit ? 'CRITICAL! ' : ''}${attacker.name} attacks ${defender.name} for $damage damage!');
    return;
  }
}
