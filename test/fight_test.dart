import 'package:flutter_test/flutter_test.dart';

import 'package:category_app2/models/models.dart';

void main() {
  test('FighterModel.getFighters() returns a list of fighters', () {
    final fighters = FighterModel.getFighters();

    expect(fighters.length, 5);
  });

  test('Fight is created with two fighters', () {
    final fighters = FighterModel.getFighters();
    final fight = Fight(fighter1: fighters[0], fighter2: fighters[1]);

    expect(fight.fighter1.name, 'Luken Light');
    expect(fight.fighter2.name, 'Luken Dark');
  });

  test('Test Fight startFight() method', () {
    final fighters = FighterModel.getFighters();
    final fight = Fight(fighter1: fighters[0], fighter2: fighters[1]);

    // print(fighters[0].stats);

    fight.startFight();

    for (var log in fight.log) {
      print('Turn ${fight.turns.length}: $log\n');
    }

    // expect(fight.turns.length, 3);
    // expect(fight.log.length, 4);
  });
}
