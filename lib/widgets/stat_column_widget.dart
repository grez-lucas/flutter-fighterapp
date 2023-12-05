import 'package:flutter/material.dart';

import '../models/fighter_model.dart';

class StatColumn extends StatelessWidget {
  const StatColumn({
    super.key,
    required this.fighter,
  });

  final FighterModel fighter;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: fighter.stats.length,
        shrinkWrap: true,
        separatorBuilder: (_, __) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (context, index2) {
          return Card(
            shadowColor: Colors.grey,
            elevation: 2,
            child: _statTile(index2),
          );
        });
  }

  ListTile _statTile(int index2) {
    return ListTile(
        leading: fighter.stats.keys.elementAt(index2).icon,
        iconColor: fighter.stats.keys.elementAt(index2).color,
        tileColor: fighter.category.bgColor,
        subtitle: Text(
          fighter.stats.keys.elementAt(index2).name,
          style: TextStyle(
            color: fighter.category.textColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        title: Text(
          fighter.stats.values.elementAt(index2).toString(),
          style: TextStyle(
            color: fighter.stats.keys.elementAt(index2).color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
