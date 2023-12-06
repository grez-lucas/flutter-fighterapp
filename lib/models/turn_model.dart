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

    final crit = attacker.stats.crit.value / 100;
    final hasCrit = Random().nextDouble() <= crit;
    int damage = 0;

    final hasHit = Random().nextDouble() <= (defender.stats.dodge.value / 100);

    if (!hasHit) {
      log.add('${attacker.name} tries to attack but ${defender.name} dodges!');
      return;
    }

    if (hasCrit) {
      damage = attacker.stats.strength.value * attacker.stats.speed.value * 2 -
          defender.stats.defense.value;
    } else {
      damage = ((attacker.stats.strength.value * attacker.stats.speed.value -
                  defender.stats.defense.value) /
              100)
          .floor();
    }
    if (damage < 0) {
      log.add('${attacker.name} tries to attack but ${defender.name} blocks!');
      return;
    }

    defender.stats.health.value = defender.stats.health.value - damage;
    log.add(
        '${hasCrit ? 'CRITICAL! ' : ''}${attacker.name} attacks ${defender.name} for $damage damage!');
    return;
  }
}
