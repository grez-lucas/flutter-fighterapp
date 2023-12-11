import 'package:flutter/material.dart';

import '../models/models.dart';

class CreateFighterScreen extends StatefulWidget {
  const CreateFighterScreen({Key? key}) : super(key: key);

  @override
  State<CreateFighterScreen> createState() => _CreateFighterScreenState();
}

class _CreateFighterScreenState extends State<CreateFighterScreen> {
  double strengthValue = 50;
  double healthValue = 50;
  double speedValue = 50;
  double critValue = 5;
  double dodgeValue = 50;
  double defenseValue = 50;

  Map<String, dynamic> formValues = {
    'name': '',
    'category': CategoryModel.getCategories()[0],
    'strength': 50,
    'health': 50,
    'speed': 50,
    'crit': 5,
    'dodge': 50,
    'defense': 50,
  };

  void setSliderValue(int value, String statName) {
    // Sets the value of the corresponding value in the formValues map
    setState(() {
      formValues[statName.toLowerCase()] = value;
    });
    // print("New value for $statName: $value");
    print(formValues);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final List<CategoryModel> categories = CategoryModel.getCategories();
    final List<StatModel> stats = StatModel.getStats();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Fighter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }

                        if (value.length < 3) {
                          return 'Please enter a name with at least 3 characters';
                        }

                        if (value.length > 15) {
                          return 'Please enter a name with less than 15 characters';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.person, color: Colors.black),
                        hintText: 'Enter a name',
                        counterText: '3 characters minimum',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                      ),
                      onChanged: (value) {
                        formValues['name'] = value;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DropdownButtonFormField<CategoryModel>(
                        onChanged: (value) {
                          formValues['category'] = value;
                        },
                        items: categories.map((category) {
                          return DropdownMenuItem<CategoryModel>(
                            value: category,
                            child: Row(
                              children: [
                                category.icon,
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(category.name),
                              ],
                            ),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.category, color: Colors.black),
                          hintText: 'Select a category',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: stats.map((stat) {
                        return StatSlider(
                            sliderValue:
                                formValues[stat.name.toLowerCase()].toDouble(),
                            stat: stat,
                            onChanged: (value) {
                              setSliderValue(value, stat.name);
                            });
                      }).toList(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Get rid of the keyboard
                        FocusScope.of(context).requestFocus(FocusNode());

                        if (!_formKey.currentState!.validate()) {
                          print("Formulario no valido");
                          return;
                        }

                        print('Create Fighter button clicked');
                        // TODO: Print form fields
                        print(formValues);
                      },
                      child: const Text('Create Fighter'),
                    ),
                  ],
                ),
              ))),
    );
  }
}

class StatSlider extends StatefulWidget {
  const StatSlider({
    Key? key,
    required this.sliderValue,
    required this.stat,
    required this.onChanged,
  }) : super(key: key);

  final double sliderValue;
  final StatModel stat;
  final ValueChanged<int> onChanged;

  @override
  State<StatSlider> createState() => _StatSliderState();
}

class _StatSliderState extends State<StatSlider> {
  @override
  Widget build(BuildContext context) {
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
          value: widget.sliderValue.toDouble(),
          onChanged: (value) {
            widget.onChanged(value.floor());
            // print(value.floor());
          },
        ),
      ],
    );
  }
}
