import 'package:flutter/material.dart';

import '../models/models.dart';
import 'app_widgets.dart';

class AnimatedSelectFighter extends StatelessWidget {
  const AnimatedSelectFighter({
    super.key,
    required this.turnEndedNotifier,
    required this.fighter,
    required this.damagedFighter,
    required this.fighterHealth,
    required this.dodged,
    required this.blocked,
    required this.crit,
  });

  final ValueNotifier<bool> turnEndedNotifier;
  final FighterModel fighter;
  final String damagedFighter;
  final int fighterHealth;
  final bool dodged;
  final bool blocked;
  final bool crit;

  bool isDamaged() {
    return damagedFighter == fighter.name;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: turnEndedNotifier,
        builder: (context, value, child) {
          return Stack(
            children: [
              SelectFighter(
                fighters: [fighter],
                index: 0,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: isDamaged()
                      ? (dodged
                          ? Colors.white.withOpacity(0.5)
                          : blocked
                              ? Colors.grey.withOpacity(0.5)
                              : crit
                                  ? Colors.yellow.withOpacity(0.8)
                                  : Colors.red.withOpacity(0.5))
                      : Colors.transparent,
                ),
                height: double.infinity,
                width: double.infinity,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      '${fighterHealth.toString()} HP',
                      style: TextStyle(
                        shadows: const [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 2)
                        ],
                        color: Colors.redAccent[700],
                        fontSize: 20,
                        decorationColor: Colors.white,
                        decorationThickness: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              if (fighterHealth <= 0) const XCircle(),
              if (!isDamaged())
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/gifs/sword-swing.gif',
                    width: 100,
                    height: 100,
                  ),
                ),
            ],
          );
        });
  }
}
