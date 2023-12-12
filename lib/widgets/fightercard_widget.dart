import 'dart:io';

import 'package:flutter/material.dart';

import '../models/models.dart';

class FighterCard extends StatelessWidget {
  const FighterCard({
    super.key,
    required this.fighter,
  });

  final FighterModel fighter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/herodetail',
            arguments: fighter,
          );
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                fighter.category.bgColor.withAlpha(1000),
                fighter.category.bgColor.withAlpha(50),
              ],
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Container(
            margin:
                const EdgeInsets.all(2), // This will act as the border width
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  fighter.category.bgColor.withOpacity(0.15),
                  fighter.category.bgColor,
                ],
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: fighter.category.icon,
                ),
                fighter.image.startsWith('assets')
                    ? Image.asset(
                        fighter.image,
                        height: 100,
                        width: 100,
                      )
                    : Image.file(
                        File(fighter.image),
                        height: 100,
                        width: 100,
                      ),
                Text(
                  fighter.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...fighter
                        .getStatsList()
                        .map((entry) {
                          return [
                            entry.statModel.icon,
                            Text(
                              entry.value.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ];
                        })
                        .expand((pair) => pair)
                        .toList()
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
