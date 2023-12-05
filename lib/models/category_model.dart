import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String image;
  String backgroundImage;
  Color textColor;
  Color bgColor;
  Icon icon;

  CategoryModel({
    required this.name,
    required this.image,
    required this.backgroundImage,
    required this.bgColor,
    required this.textColor,
    required this.icon,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
      name: 'Light',
      image: 'assets/icons/light.png',
      backgroundImage: 'assets/backgrounds/light-bg.jpeg',
      bgColor: const Color.fromARGB(255, 219, 218, 168),
      textColor: Colors.white54,
      icon: const Icon(Icons.bolt),
    ));

    categories.add(CategoryModel(
      name: 'Dark',
      image: 'assets/icons/dark.png',
      backgroundImage: 'assets/backgrounds/dark-bg.jpeg',
      bgColor: const Color.fromARGB(255, 28, 20, 34),
      textColor: Colors.white60,
      icon: const Icon(Icons.nightlight_round),
    ));

    categories.add(CategoryModel(
      name: 'Fire',
      image: 'assets/icons/fire.png',
      backgroundImage: 'assets/backgrounds/fire-bg.jpeg',
      bgColor: const Color.fromARGB(255, 224, 180, 98),
      textColor: Colors.white60,
      icon: const Icon(Icons.fire_extinguisher),
    ));

    categories.add(CategoryModel(
      name: 'Water',
      image: 'assets/icons/water.png',
      backgroundImage: 'assets/backgrounds/water-bg.jpeg',
      bgColor: const Color.fromARGB(255, 128, 151, 182),
      textColor: Colors.white60,
      icon: const Icon(Icons.water),
    ));

    categories.add(CategoryModel(
      name: 'Earth',
      image: 'assets/icons/earth.png',
      backgroundImage: 'assets/backgrounds/earth-bg.jpeg',
      bgColor: const Color.fromARGB(255, 95, 67, 43),
      textColor: Colors.white60,
      icon: const Icon(Icons.eco),
    ));

    return categories;
  }
}
