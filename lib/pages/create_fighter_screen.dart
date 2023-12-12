import 'package:category_app2/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/models.dart';

class CreateFighterScreen extends StatelessWidget {
  Map<String, dynamic> formValues = {
    'name': '',
    'description': '',
    'image': null,
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
    final ValueNotifier<CategoryModel> categoryNotifier =
        ValueNotifier<CategoryModel>(categories[0]);

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
                    ImageForm(
                        categoryNotifier: categoryNotifier,
                        formValues: formValues),
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
                    NameForm(
                      formProperty: 'description',
                      formValues: formValues,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CategoryDropDown(
                      categories: categories,
                      formValues: formValues,
                      categoryNotifier: categoryNotifier,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    StatsWrapper(stats: stats, formValues: formValues),
                    ElevatedButton(
                      onPressed: () {
                        // Get rid of the keyboard
                        FocusScope.of(context).requestFocus(FocusNode());

                        if (!_formKey.currentState!.validate() ||
                            formValues['image'] == null) {
                          print("Form is not valid");
                          return;
                        }

                        // print('Create Fighter button clicked');
                        // TODO: Print form fields
                        print(formValues);

                        // Create a new fighter
                        FighterModel fighter = FighterModel(
                          name: formValues['name'],
                          description: formValues['description'],
                          image: formValues['image'],
                          category: formValues['category'],
                          stats: FighterStats(
                            strength: FighterStat(
                                statModel: stats.firstWhere(
                                    (element) => element.name == 'Strength'),
                                value: formValues['strength'].toInt()),
                            health: FighterStat(
                                statModel: stats.firstWhere(
                                    (element) => element.name == 'Health'),
                                value: formValues['health'].toInt()),
                            speed: FighterStat(
                                statModel: stats.firstWhere(
                                    (element) => element.name == 'Speed'),
                                value: formValues['speed'].toInt()),
                            crit: FighterStat(
                                statModel: stats.firstWhere(
                                    (element) => element.name == 'Crit'),
                                value: formValues['crit'].toInt()),
                            dodge: FighterStat(
                                statModel: stats.firstWhere(
                                    (element) => element.name == 'Dodge'),
                                value: formValues['dodge'].toInt()),
                            defense: FighterStat(
                                statModel: stats.firstWhere(
                                    (element) => element.name == 'Defense'),
                                value: formValues['defense'].toInt()),
                          ),
                        );

                        // Add the fighter to the list of fighters
                        FighterModel.addFighter(fighter);

                        // Go back to the previous screen
                        Navigator.pop(context);
                      },
                      child: const Text('Create Fighter'),
                    ),
                  ],
                ),
              ))),
    );
  }
}
