import 'package:category_app2/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CreateFighterScreen extends StatelessWidget {
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
                    Stack(children: [
                      Card(
                        elevation: 10,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FadeInImage(
                          width: double.infinity,
                          height: 200,
                          fadeInDuration: const Duration(milliseconds: 200),
                          placeholder:
                              const AssetImage('assets/gifs/loading.gif'),
                          image: AssetImage(
                              formValues['category'].backgroundImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        top: 50,
                        right: 100,
                        child: Image(
                          image: AssetImage('assets/icons/luken-light.png'),
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const Positioned(
                        bottom: 15,
                        right: 20,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 30,
                    ),
                    NameForm(
                      formProperty: 'name',
                      formValues: formValues,
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
                    StatsWrapper(stats: stats, formValues: formValues),
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

class NameForm extends StatelessWidget {
  const NameForm({
    super.key,
    required this.formProperty,
    required this.formValues,
  });

  final String formProperty;
  final Map<String, dynamic> formValues;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: '',
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
        formValues[formProperty] = value;
        // onChanged(value);
      },
    );
  }
}
