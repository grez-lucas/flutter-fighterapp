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
                    Stack(children: [
                      ValueListenableBuilder(
                        valueListenable: categoryNotifier,
                        builder: (context, CategoryModel value, child) {
                          return ImageCardField(category: value);
                        },
                      ),
                      Positioned(
                        top: 50,
                        right: 100,
                        child: Image(
                          image: AssetImage(
                              "assets/icons/luken-${formValues['category'].name.toLowerCase()}.png"),
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 20,
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt_outlined,
                              color: Colors.white, size: 35),
                          onPressed: () {
                            print('Camera button clicked');
                          },
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


