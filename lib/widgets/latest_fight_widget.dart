import 'package:flutter/material.dart';

import '../models/models.dart';

class LatestFight extends StatelessWidget {
  const LatestFight({
    super.key,
    required this.fights,
    required this.index,
  });

  final List<Fight> fights;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2,
              offset: Offset(1, 1),
              blurStyle: BlurStyle.inner,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              fights[index].fighter1.category.bgColor,
              fights[index].fighter2.category.bgColor
            ],
          ),
        ),
        child: ListTile(
          trailing: CircleAvatar(
            maxRadius: 30,
            backgroundImage: AssetImage(fights[index].fighter2.image),
            backgroundColor: fights[index].fighter2.category.bgColor,
          ),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundImage: AssetImage(fights[index].fighter1.image),
            backgroundColor: fights[index].fighter1.category.bgColor,
          ),
          title: Text(
            '${fights[index].fighter1.name} VS ${fights[index].fighter2.name}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          titleAlignment: ListTileTitleAlignment.center,
          subtitle: Text(
            'Winner: ${fights[index].winner.name}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
