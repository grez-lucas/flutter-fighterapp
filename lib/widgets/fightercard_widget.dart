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
      child: Card(
        color: fighter.category.bgColor.withOpacity(0.75),
        shadowColor: Colors.grey,
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
    );
  }
}
