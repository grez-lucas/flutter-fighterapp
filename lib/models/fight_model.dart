import "models.dart";

class Fight {
  final FighterModel fighter1;
  final FighterModel fighter2;
  final List<Turn> turns = [];
  final List<String> log = [];

  Fight({required this.fighter1, required this.fighter2});

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
  }
}
