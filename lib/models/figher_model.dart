import 'package:flutter/material.dart';

class FighterModel {
  String name;
  String category;
  String image;
  int strength;
  int health;
  int speed;
  int crit;
  int dodge;
  int defense;

  FighterModel(
      {required this.name,
      required this.category,
      required this.image,
      required this.strength,
      required this.health,
      required this.speed,
      required this.crit,
      required this.dodge,
      required this.defense});

  Map<String, dynamic> toJson() => {
        'name': name,
        'category': category,
        'image': image,
        'strength': strength,
        'health': health,
        'speed': speed,
        'crit': crit,
        'dodge': dodge,
        'defense': defense,
      };

  static List<FighterModel> getFighters() {
    List<FighterModel> fighters = [];

    fighters.add(FighterModel(
        name: 'Luken Light',
        category: 'Light',
        image: 'assets/icons/luken-light.png',
        strength: 50,
        health: 100,
        speed: 70,
        crit: 8,
        dodge: 50,
        defense: 60));

    fighters.add(FighterModel(
        name: 'Luken Dark',
        category: 'Dark',
        image: 'assets/icons/luken-dark.png',
        strength: 80,
        health: 40,
        speed: 40,
        crit: 8,
        dodge: 20,
        defense: 70));

    return fighters;
  }
}
