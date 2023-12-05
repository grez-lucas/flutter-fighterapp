import 'package:flutter/material.dart';

import '../models/models.dart';
// TODO: Refactor this widget to use new models
class FighterCard extends StatelessWidget {
  const FighterCard({
    super.key,
    required this.fighters,
    required this.index,
  });

  final List<FighterModel> fighters;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: {
        'Light': Colors.yellow[100],
        'Dark': const Color.fromARGB(255, 103, 77, 134),
        'Fire': Colors.orange[100],
        'Water': Colors.blue[100],
        'Earth': Colors.brown[200],
      }[fighters[index].category],
      shadowColor: Colors.grey,
      child: Column(
        children: [
          ListTile(
            leading: {
              'Light': const Icon(Icons.bolt),
              'Dark': const Icon(Icons.nightlight_round),
              'Fire': const Icon(Icons.fire_extinguisher),
              'Water': const Icon(Icons.water),
              'Earth': const Icon(Icons.eco)
            }[fighters[index].category],
          ),
          Image.asset(
            fighters[index].image,
            height: 100,
            width: 100,
          ),
          Text(
            fighters[index].name,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.fitness_center_outlined, size: 18),
              Text(
                fighters[index].stats['strength'].toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const Icon(Icons.favorite, size: 18),
              Text(
                fighters[index].stats['health'].toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const Icon(Icons.speed, size: 18),
              Text(
                fighters[index].stats['speed'].toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const Icon(Icons.bolt, size: 18),
              Text(
                fighters[index].stats['crit'].toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const Icon(Icons.shield, size: 18),
              Text(
                fighters[index].stats['dodge'].toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
