import 'package:flutter/material.dart';

class StatModel {
  String name;
  Icon icon;
  Color color;

  StatModel({
    required this.name,
    required this.icon,
    required this.color,
  });

  static List<StatModel> getStats() {
    List<StatModel> stats = [];

    stats.add(StatModel(
      name: 'Strength',
      icon: const Icon(Icons.fitness_center_outlined, size: 18),
      color: Colors.red,
    ));

    stats.add(StatModel(
      name: 'Health',
      icon: const Icon(Icons.favorite, size: 18),
      color: Colors.green,
    ));

    stats.add(StatModel(
      name: 'Speed',
      icon: const Icon(Icons.speed, size: 18),
      color: Colors.blue,
    ));

    stats.add(StatModel(
      name: 'Crit',
      icon: const Icon(Icons.bolt, size: 18),
      color: Colors.yellow,
    ));

    stats.add(StatModel(
      name: 'Dodge',
      icon: const Icon(Icons.transfer_within_a_station_rounded, size: 18),
      color: Colors.orange,
    ));

    stats.add(StatModel(
        name: 'Defense', icon: const Icon(Icons.shield), color: Colors.purple));

    return stats;
  }
}
