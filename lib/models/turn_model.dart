import "dart:math";

import 'package:audioplayers/audioplayers.dart';

import 'models.dart';

class Turn {
  final int turnNumber;
  final FighterModel attacker;
  final FighterModel defender;
  final List<String> log;
  int dealtDamage = 0;
  bool isCrit = false;
  bool isDodged = false;
  bool isBlocked = false;

  Turn({
    required this.turnNumber,
    required this.attacker,
    required this.defender,
    required this.log,
  });

  void setDealtDamage(int damage) {
    dealtDamage = damage;
  }

  void setCrit(bool crit) {
    isCrit = crit;
  }

  void setDodged(bool dodged) {
    isDodged = dodged;
  }

  void setBlocked(bool blocked) {
    isBlocked = blocked;
  }

  AssetSource getDefenderSound() {
    if (isDodged) {
      return AssetSource('audio/chuckle.mp3');
    } else if (isBlocked) {
      return AssetSource('audio/block.mp3');
    } else {
      return AssetSource('audio/grunt.mp3');
    }
  }

  AssetSource getAttackerSound() {
    if (isCrit) {
      return AssetSource('audio/crit.mp3');
    } else {
      return AssetSource('audio/attack.mp3');
    }
  }

  void playSound() {
    AssetSource defenderSound = getDefenderSound();
    AssetSource attackerSound = getAttackerSound();

    AudioPlayer().play(attackerSound);
    Future.delayed(const Duration(milliseconds: 500), () {
      AudioPlayer().play(defenderSound);
    });
  }

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
    setCrit(hasCrit);
    int damage = 0;

    final hasHit = Random().nextDouble() <= (defender.stats.dodge.value / 100);

    if (!hasHit) {
      log.add('${attacker.name} tries to attack but ${defender.name} dodges!');
      setDodged(true);
      return;
    }

    if (hasCrit) {
      damage =
          ((attacker.stats.strength.value * attacker.stats.speed.value * 2 -
                      defender.stats.defense.value) /
                  100)
              .floor();
    } else {
      damage = ((attacker.stats.strength.value * attacker.stats.speed.value -
                  defender.stats.defense.value) /
              100)
          .floor();
    }
    if (damage < 0) {
      log.add('${attacker.name} tries to attack but ${defender.name} blocks!');
      setBlocked(true);
      return;
    }

    setDealtDamage(damage);
    defender.stats.health.value = defender.stats.health.value - damage;
    log.add(
        '${hasCrit ? 'CRITICAL! ' : ''}${attacker.name} attacks ${defender.name} for $damage damage!');
    return;
  }
}
