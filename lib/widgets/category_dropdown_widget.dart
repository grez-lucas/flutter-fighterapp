import 'package:flutter/material.dart';

import '../models/models.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({
    super.key,
    required this.categories,
    required this.formValues,
    required this.categoryNotifier,
  });

  final List<CategoryModel> categories;
  final Map<String, dynamic> formValues;
  final ValueNotifier<CategoryModel> categoryNotifier;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CategoryModel>(
        value: categories[0],
        onChanged: (value) {
          formValues['category'] = value;
          categoryNotifier.value = value!;

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
        ));
  }
}