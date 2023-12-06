import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class LogContainer extends StatefulWidget {
  const LogContainer({
    super.key,
    required this.fight,
  });

  final Fight fight;

  @override
  State<LogContainer> createState() => _LogContainerState();
}

class _LogContainerState extends State<LogContainer> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> _fightLogLines = [];
  Timer? _timer;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      var totalTurns = widget.fight.turns.length;
      var totalFightLogLines = widget.fight.getFightLog().split("\n").length;

      if (_fightLogLines.length < totalFightLogLines) {
        var currentTurnLog =
            widget.fight.getFightLog().split("\n")[_fightLogLines.length];
        _fightLogLines.add(currentTurnLog);
        _listKey.currentState?.insertItem(_fightLogLines.length - 1);

        // Scroll to the bottom of the list
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOut,
        );

        // Play sound effect of the turn
        if (_fightLogLines.length > 1 &&
            _fightLogLines.length < totalFightLogLines - 1) {
          var currentTurn = widget.fight.turns[_fightLogLines.length - 2];
          currentTurn.playSound();
        } else {
          // If a player is dead, play death sound
          if (_fightLogLines.length == totalFightLogLines - 1) {
            AudioPlayer().play(AssetSource('audio/death.mp3'));
          }
        }
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 190,
      width: 290,
      child: Column(
        children: [
          const Text(
            "Log",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          ),
          Expanded(
            child: AnimatedList(
              controller: _scrollController,
              key: _listKey,
              initialItemCount: _fightLogLines.length,
              itemBuilder: (context, index, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      _fightLogLines[index],
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
