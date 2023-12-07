import 'package:flutter/material.dart';

import '../models/models.dart';

class CreateFighterScreen extends StatefulWidget {
  const CreateFighterScreen({Key? key}) : super(key: key);

  @override
  State<CreateFighterScreen> createState() => _CreateFighterScreenState();
}

class _CreateFighterScreenState extends State<CreateFighterScreen> {
  double _strengthSliderValue = 50;

  void setStrengthSliderValue(double value) {
    setState(() {
      _strengthSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final List<CategoryModel> categories = CategoryModel.getCategories();
    final List<StatModel> stats = StatModel.getStats();

    final Map<String, dynamic> formValues = {
      'name': '',
      'category': '',
      'image': '',
      'strength': 50,
      'health': 50,
    };

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
                            sliderValue: _strengthSliderValue, stat: stat);
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

class StatSlider extends StatelessWidget {
  const StatSlider({
    super.key,
    required this.sliderValue,
    required this.stat,
  });

  final double sliderValue;
  final StatModel stat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              stat.icon,
              const SizedBox(
                width: 10,
              ),
              Text(stat.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Slider.adaptive(
          activeColor: stat.color,
          min: 0,
          max: 100,
          divisions: 10,
          value: sliderValue,
          onChanged: (value) {
            // sliderValue = value
          },
        ),
      ],
    );
  }
}
