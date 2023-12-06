import 'dart:math';

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

    FighterModel fighter1;
    FighterModel fighter2;

    do {
      fighter1 = fighters[Random().nextInt(fighters.length)];
      fighter2 = fighters[Random().nextInt(fighters.length)];
    } while (fighters[0].name == fighters[1].name);

    final fight = Fight(fighter1: fighter1, fighter2: fighter2);

    // print(fighters[0].stats);

    fight.startFight();

    fight.log.asMap().forEach((index, log) {
      print('Turn ${fight.turns.length}: $log\n');
    });

    // expect(fight.turns.length, 3);
    // expect(fight.log.length, 4);
  });
}
