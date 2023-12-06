import 'package:flutter/material.dart';

import '../models/models.dart';

class LogContainer extends StatelessWidget {
  const LogContainer({
    super.key,
    required this.fight,
  });

  final Fight fight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      height: 190,
      width: 290,
      child: Column(
        children: [
          const Text(
            "Log",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w200),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fight.getFightLog().split("\n").length,
              itemBuilder: (context, index) {
                return Text(
                  fight
                      .getFightLog()
                      .split("\n")[index],
                  style: const TextStyle(
                    fontSize: 15,
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
