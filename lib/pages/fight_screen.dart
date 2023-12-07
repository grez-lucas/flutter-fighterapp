import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:category_app2/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/app_widgets.dart';

class FightScreen extends StatefulWidget {
  const FightScreen({Key? key}) : super(key: key);

  @override
  State<FightScreen> createState() => _FightScreenState();
}

class _FightScreenState extends State<FightScreen> {
  List<FighterModel> fighters = [];
  late FighterModel fighter1;
  late FighterModel fighter2;

  List<FighterModel> fighter1Options = [];
  List<FighterModel> fighter2Options = [];

  late Fight fight;

  bool fightStarted = false;

  final ValueNotifier<bool> turnEndedNotifier = ValueNotifier<bool>(false);

  // Stuff for the fight log
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  Timer? _timer;
  String damagedFighter = "";
  final List<String> _fightLogLines = [];
  final ScrollController _scrollController = ScrollController();
  late int fighter1OriginalHealth;
  late int fighter2OriginalHealth;
  bool dodged = false;
  bool blocked = false;
  bool crit = false;

  void _getFighters() {
    fighters = FighterModel.getFighters();
  }

  void _updateFighterOptions() {
    _updateFighter1Options();
    _updateFighter2Options();
  }

  void _updateFighter1Options() {
    setState(() {
      fighter1Options =
          fighters.where((fighter) => fighter != fighter2).toList();
    });
  }

  void _updateFighter2Options() {
    setState(() {
      fighter2Options =
          fighters.where((fighter) => fighter != fighter1).toList();
    });
  }

  void setFighter1(FighterModel fighter) {
    setState(() {
      fighter1 = fighter;
    });
  }

  void setFighter2(FighterModel fighter) {
    setState(() {
      fighter2 = fighter;
    });
  }

  void setFighter1Health(int health) {
    setState(() {
      fighter1OriginalHealth = health;
    });
  }

  void setFighter2Health(int health) {
    setState(() {
      fighter2OriginalHealth = health;
    });
  }

  void _startFight() {
    setState(() {
      // Copy the original health values
      fighter1OriginalHealth = fighter1.stats.health.value;
      fighter2OriginalHealth = fighter2.stats.health.value;
      // Make a copy of each fighter so that the original stats are not modified
      fighter1 = FighterModel.copy(fighter1);
      fighter2 = FighterModel.copy(fighter2);

      fight = Fight(fighter1: fighter1, fighter2: fighter2);
      fightStarted = true;
    });

    fight.startFight();
  }

  void endTurn() {
    turnEndedNotifier.value = true;
    turnEndedNotifier.value = false;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      var totalFightLogLines = fight.getFightLog().split("\n").length;

      if (_fightLogLines.length < totalFightLogLines) {
        updateTurnLog();

        // Scroll to the bottom of the list
        scrollToLogBottom();

        // Set the damaged fighter and health if the turn is not the first or last
        setDamagedFighterHealth(totalFightLogLines);

        // Play sound effect of the turn
        playTurnSoundEffect(totalFightLogLines);

        endTurn();
      } else {
        timer.cancel();
      }
    });
  }

  void updateTurnLog() {
    var currentTurnLog = fight.getFightLog().split("\n")[_fightLogLines.length];
    _fightLogLines.add(currentTurnLog);
    _listKey.currentState?.insertItem(_fightLogLines.length - 1);
  }

  void setDamagedFighterHealth(int totalFightLogLines) {
    if (_fightLogLines.length > 1 &&
        _fightLogLines.length < totalFightLogLines - 1) {
      var currentTurn = fight.turns[_fightLogLines.length - 2];

      setState(() {
        damagedFighter = currentTurn.defender.name;
        if (currentTurn.defender.name == fighter1.name) {
          setFighter1Health(fighter1OriginalHealth - currentTurn.dealtDamage);
        } else {
          setFighter2Health(fighter2OriginalHealth - currentTurn.dealtDamage);
        }

        dodged = currentTurn.isDodged;
        blocked = currentTurn.isBlocked;
        crit = currentTurn.isCrit;
      });
    }
  }

  void scrollToLogBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOut,
    );
  }

  void playTurnSoundEffect(int totalFightLogLines) {
    if (_fightLogLines.length > 1 &&
        _fightLogLines.length < totalFightLogLines - 1) {
      var currentTurn = fight.turns[_fightLogLines.length - 2];
      currentTurn.playSound();
    } else {
      // If a player is dead, play death sound
      if (_fightLogLines.length == totalFightLogLines - 1) {
        AudioPlayer().play(AssetSource('audio/death.mp3'));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getFighters();
    fighter1 = fighters[0];
    fighter2 = fighters[1];
    _updateFighterOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fight'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: fightStarted
                                      ? AnimatedSelectFighter(
                                          turnEndedNotifier: turnEndedNotifier,
                                          fighter: fighter1,
                                          damagedFighter: damagedFighter,
                                          fighterHealth: fighter1OriginalHealth,
                                          dodged: dodged,
                                          blocked: blocked,
                                          crit: crit,
                                        )
                                      : PageView.builder(
                                          onPageChanged: (int index) {
                                            setFighter1(fighter1Options[index]);
                                            _updateFighter2Options();
                                          },
                                          itemCount: fighter1Options.length,
                                          itemBuilder: (context, index) {
                                            return SelectFighter(
                                              fighters: fighter1Options,
                                              index: index,
                                            );
                                          },
                                        ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: fightStarted
                                      ? AnimatedSelectFighter(
                                          turnEndedNotifier: turnEndedNotifier,
                                          fighter: fighter2,
                                          damagedFighter: damagedFighter,
                                          fighterHealth: fighter2OriginalHealth,
                                          dodged: dodged,
                                          blocked: blocked,
                                          crit: crit,
                                        )
                                      : PageView.builder(
                                          onPageChanged: (int index) {
                                            setFighter2(fighter2Options[index]);
                                            _updateFighter1Options();
                                          },
                                          itemCount: fighter2Options.length,
                                          itemBuilder: (context, index) {
                                            return SelectFighter(
                                              fighters: fighter2Options,
                                              index: index,
                                            );
                                          },
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const VSCircle(),
                      ],
                    )),
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.black,
                          width: 4,
                        ),
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            if (fightStarted)
                              LogContainer(
                                fight: fight,
                                fightLogLines: _fightLogLines,
                                listKey: _listKey,
                                scrollController: _scrollController,
                                timer: _timer,
                              )
                            else
                              ElevatedButton(
                                onPressed: () {
                                  AudioPlayer().play(
                                      AssetSource('audio/ready-fight.mp3'));
                                  _startFight();
                                  startTimer();
                                },
                                child: const Text("Begin Fight"),
                              ),
                          ],
                        ),
                      )),
                ),
              ]),
            ),
          ],
        ));
  }
}
