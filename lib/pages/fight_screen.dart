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

  void _getFighters() {
    fighters = FighterModel.getFighters();
  }

  void _updateFighterOptions() {
    _updateFighter1Options();
    _updateFighter2Options();
  }

  void _updateFighter1Options() {
    fighter1Options = fighters.where((fighter) => fighter != fighter2).toList();
  }

  void _updateFighter2Options() {
    fighter2Options = fighters.where((fighter) => fighter != fighter1).toList();
  }

  void _startFight() {
    fight = Fight(fighter1: fighter1, fighter2: fighter2);
    fight.startFight();
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
                                  child: PageView.builder(
                                    onPageChanged: (int index) {
                                      setState(() {
                                        fighter1 = fighter1Options[index];
                                        _updateFighter2Options();
                                      });
                                    },
                                    itemCount: fighter1Options.length,
                                    itemBuilder: (context, index) {
                                      return SelectFighter(
                                          fighters: fighter1Options,
                                          index: index);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: PageView.builder(
                                    onPageChanged: (int index) {
                                      setState(() {
                                        fighter2 = fighter2Options[index];
                                        _updateFighter1Options();
                                      });
                                    },
                                    itemCount: fighter2Options.length,
                                    itemBuilder: (context, index) {
                                      return SelectFighter(
                                          fighters: fighter2Options,
                                          index: index);
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
                              LogContainer(fight: fight)
                            else
                              ElevatedButton(
                                onPressed: () {
                                  AudioPlayer()
                                      .play(AssetSource('audio/gong.mp3'));
                                  _startFight();
                                  setState(() => fightStarted = true);
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
