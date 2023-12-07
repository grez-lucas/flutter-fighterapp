import "models.dart";

class Fight {
  final FighterModel fighter1;
  final FighterModel fighter2;
  final List<Turn> turns = [];
  final List<String> log = [];

  static List<Fight> fights = [];

  Fight({required this.fighter1, required this.fighter2});

  FighterModel getFighter1() {
    return fighter1;
  }

  FighterModel getFighter2() {
    return fighter2;
  }

  void endFight() {
    fights.add(this);

    // If there are more than three fights, remove the oldest one
    if (fights.length > 3) {
      fights.removeAt(0);
    }
  }

  static List<Fight> getFights() {
    return fights;
  }

  void startFight() {
    int turnNumber = 1;
    Turn turn;
    FighterModel currentAttacker;
    FighterModel currentDefender;

    // First attacker is the one with the highest speed
    if (fighter1.stats.speed.value > fighter2.stats.speed.value) {
      log.add('${fighter1.name} attacks first!');
      currentAttacker = fighter1;
      currentDefender = fighter2;
    } else {
      log.add('${fighter2.name} attacks first!');
      currentAttacker = fighter2;
      currentDefender = fighter1;
    }

    while (fighter1.isAlive() && fighter2.isAlive()) {
      if (turnNumber > 30) {
        log.add(
            'The fight has reached the maximum number of turns. It is a draw.');
        break;
      }

      turn = Turn(
        turnNumber: turnNumber,
        attacker: currentAttacker,
        defender: currentDefender,
        log: log,
      );
      turn.resolveTurn();
      turns.add(turn);

      if (!fighter2.isAlive()) {
        log.add('${fighter1.name} wins!');
        break;
      }

      if (!fighter1.isAlive()) {
        log.add('${fighter2.name} wins!');
        break;
      }

      // Switch attacker and defender
      currentAttacker = currentDefender;
      currentDefender = currentAttacker == fighter1 ? fighter2 : fighter1;
      turnNumber++;
    }
    endFight();
  }

  String getFightLog() {
    String fightLog = '';

    fightLog += '${log[0]}\n';
    log.sublist(1, log.length - 1).asMap().forEach((index, log) {
      fightLog += 'Turn ${index + 1}: $log\n';
    });
    fightLog += '${log[log.length - 1]}\n';

    return fightLog;
  }
}
