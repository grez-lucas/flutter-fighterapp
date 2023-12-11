import 'package:flutter/material.dart';

import '../models/models.dart';

class StatSlider extends StatefulWidget {
  const StatSlider({
    Key? key,
    required this.sliderValue,
    required this.stat,
    required this.onChanged,
  }) : super(key: key);

  final double sliderValue;
  final StatModel stat;
  final Function(String statName, double value) onChanged;

  @override
  State<StatSlider> createState() => _StatSliderState();
}

class _StatSliderState extends State<StatSlider> {
  double _sliderValue = 50;

  @override
  void initState() {
    super.initState();
    // Set the initial value based on the formValues
    _sliderValue = widget.sliderValue;
  }

  @override
  void didUpdateWidget(StatSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update the _sliderValue when the widget property changes
    _sliderValue = widget.sliderValue;
  }

  @override
  Widget build(BuildContext context) {
    // print("StatSlider ${widget.stat.name} rebuild");
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.stat.icon,
              const SizedBox(
                width: 10,
              ),
              Text(widget.stat.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Slider.adaptive(
          activeColor: widget.stat.color,
          min: widget.stat.min.toDouble(),
          max: widget.stat.max.toDouble(),
          divisions: 10,
          value: _sliderValue,
          onChanged: (value) {
            // formValues[stat.name.toLowerCase()] = value.floor();
            // print("currentValue: $_sliderValue");
            setState(() {
              _sliderValue = value;
              widget.onChanged(widget.stat.name, value.floor().toDouble());
            });
            // print(value.floor());
          },
        ),
        Text(
          _sliderValue.floor().toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
