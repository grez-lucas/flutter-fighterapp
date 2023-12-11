import 'package:flutter/material.dart';

import '../models/models.dart';
import 'stat_slider_widget.dart';

class StatsWrapper extends StatefulWidget {
  const StatsWrapper({
    super.key,
    required this.stats,
    required this.formValues,
  });

  final List<StatModel> stats;
  final Map<String, dynamic> formValues;

  @override
  State<StatsWrapper> createState() => _StatsWrapperState();
}

class _StatsWrapperState extends State<StatsWrapper> {
  Map<String, double> _wrapperStats = {
    'Strength': 50,
    'Health': 50,
    'Speed': 50,
    'Crit': 5,
    'Dodge': 50,
    'Defense': 50,
  };

  void onChange(String statName, double value) {
    print('statName: $statName');
    setState(() {
      _wrapperStats[statName] = value;
      widget.formValues[statName.toLowerCase()] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("StatsWrapper rebuild");
    return Column(
      children: widget.stats.map((stat) {
        double initialValue =
            widget.formValues[stat.name.toLowerCase()].toDouble() ?? 50.0;
        return StatSlider(
          key: UniqueKey(),
          sliderValue: initialValue,
          stat: stat,
          onChanged: (statName, value) {
            onChange(statName, value);
          },
        );
      }).toList(),
    );
  }
}