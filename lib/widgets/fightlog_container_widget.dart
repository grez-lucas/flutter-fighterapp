import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class LogContainer extends StatelessWidget {
  const LogContainer({
    super.key,
    required this.fight,
    required this.timer,
    required this.fightLogLines,
    required this.scrollController,
    required this.listKey,
  });

  final GlobalKey<AnimatedListState> listKey;
  final Fight fight;
  final Timer? timer;
  final List<String> fightLogLines;
  final ScrollController scrollController;

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
              controller: scrollController,
              key: listKey,
              initialItemCount: fightLogLines.length,
              itemBuilder: (context, index, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      fightLogLines[index],
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
