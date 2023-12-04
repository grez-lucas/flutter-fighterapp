import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String image;
  Color bgColor;

  CategoryModel(
      {required this.name, required this.image, required this.bgColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Light',
        image: 'assets/icons/light.png',
        bgColor: Color.fromARGB(255, 219, 218, 168)));

    categories.add(CategoryModel(
        name: 'Dark',
        image: 'assets/icons/dark.png',
        bgColor: Color.fromARGB(255, 28, 20, 34)));

    categories.add(CategoryModel(
        name: 'Fire',
        image: 'assets/icons/fire.png',
        bgColor: Color.fromARGB(255, 224, 180, 98)));

    categories.add(CategoryModel(
        name: 'Water',
        image: 'assets/icons/water.png',
        bgColor: Color.fromARGB(255, 128, 151, 182)));

    categories.add(CategoryModel(
        name: 'Earth',
        image: 'assets/icons/earth.png',
        bgColor: Color.fromARGB(255, 95, 67, 43)));

    return categories;
  }
}
