import 'package:flutter/material.dart';

class FighterModel {
  String name;
  String category;
  String image;
  String description;
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
      required this.description,
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
        'description': description,
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
        description:
            "From the shadows emerges Luken Dark, a mysterious and cunning champion who harnesses the power of obscurity. Cloaked in darkness, Luken Dark maneuvers through the battlefield, striking unsuspecting foes with a blend of stealth and guile. Their silhouette conceals treacherous intent as they manipulate shadows to confound enemies, making them the epitome of enigmatic malevolence on the elemental stage.",
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
        description:
            "From the shadows emerges Luken Dark, a mysterious and cunning champion who harnesses the power of obscurity. Cloaked in darkness, Luken Dark maneuvers through the battlefield, striking unsuspecting foes with a blend of stealth and guile. Their silhouette conceals treacherous intent as they manipulate shadows to confound enemies, making them the epitome of enigmatic malevolence on the elemental stage.",
        strength: 80,
        health: 40,
        speed: 40,
        crit: 8,
        dodge: 20,
        defense: 70));

    fighters.add(FighterModel(
        name: 'Luken Water',
        category: 'Water',
        image: 'assets/icons/luken-water.png',
        description:
            "The arena resonates with the rhythmic flow as Luken Water takes center stage, a champion of fluidity and adaptability. With mastery over aquatic forces, this elemental warrior commands the tides, unleashing waves that drown adversaries in a relentless torrent of power. Luken Water moves like the ebb and flow of the ocean, adapting to any challenge with a fluid grace that confounds foes and makes them an unpredictable force to be reckoned with.",
        strength: 40,
        health: 60,
        speed: 90,
        crit: 4,
        dodge: 60,
        defense: 30));

    fighters.add(FighterModel(
        name: 'Luken Fire',
        category: 'Fire',
        image: 'assets/icons/luken-fire.png',
        description:
            "Burning with unbridled passion, Luken Fire ignites the arena with the ferocious might of flames. This elemental champion channels the searing power of fire to scorch enemies and turn the battlefield into a blazing inferno. Armed with a fiery resolve, Luken Fire leaves adversaries in ashes while moving with the relentless intensity of a wildfire, leaving a trail of destruction in their wake.",
        strength: 40,
        health: 60,
        speed: 40,
        crit: 5,
        dodge: 30,
        defense: 40));

    fighters.add(FighterModel(
        name: 'Luken Earth',
        category: 'Earth',
        image: 'assets/icons/luken-earth.png',
        description:
            "A stalwart defender on the elemental battleground, Luken Earth stands firm, rooted in unyielding strength. With the solidity of the earth itself, this champion shields allies from harm and crushes adversaries beneath the weight of unrelenting force. Clad in armor hewn from the very bedrock, Luken Earth embodies resilience and fortitude, turning the arena into a domain of unshakeable stability.",
        strength: 30,
        health: 70,
        speed: 80,
        crit: 7,
        dodge: 50,
        defense: 40));

    return fighters;
  }
}
