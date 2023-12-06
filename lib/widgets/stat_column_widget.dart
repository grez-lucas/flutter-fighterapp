import 'dart:js_interop';

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
        itemCount: fighter.getStatsList().length,
        shrinkWrap: true,
        separatorBuilder: (_, __) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.grey,
            elevation: 2,
            child: _statTile(index),
          );
        });
  }

  ListTile _statTile(int index) {
    List<FighterStat> statsList = fighter.getStatsList();

    return ListTile(
        leading: statsList[index].statModel.icon,
        iconColor: statsList[index].statModel.color,
        tileColor: fighter.category.bgColor,
        subtitle: Text(
          statsList[index].statModel.name,
          style: TextStyle(
            color: fighter.category.textColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        title: Text(
          statsList[index].value.toString(),
          style: TextStyle(
            color: statsList[index].statModel.color,
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
