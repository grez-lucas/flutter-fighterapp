import 'category_model.dart';
import 'stat_model.dart';

class FighterModel {
  String name;
  CategoryModel category;
  String image;
  String description;
  Map<StatModel, int> stats = {
    statsList.firstWhere((element) => element.name == 'Strength'): 0,
    statsList.firstWhere((element) => element.name == 'Health'): 0,
    statsList.firstWhere((element) => element.name == 'Speed'): 0,
    statsList.firstWhere((element) => element.name == 'Crit'): 0,
    statsList.firstWhere((element) => element.name == 'Dodge'): 0,
    statsList.firstWhere((element) => element.name == 'Defense'): 0,
  };

  static List<CategoryModel> categories = CategoryModel.getCategories();
  static List<StatModel> statsList = StatModel.getStats();
  
  FighterModel(
      {required this.name,
      required this.category,
      required this.image,
      required this.description,
      required this.stats});

  Map<String, dynamic> toJson() => {
        'name': name,
        'category': category,
        'image': image,
        'description': description,
        'stats': stats,
      };

  List<StatModel> getStats() {
    return statsList;
  }

  bool isAlive() {
    return stats[statsList.firstWhere((element) => element.name == 'Health')]! >
        0;
  }

  static List<FighterModel> getFighters() {
    List<FighterModel> fighters = [];

    fighters.add(FighterModel(
        name: 'Luken Light',
        category: categories.firstWhere((element) => element.name == 'Light'),
        image: 'assets/icons/luken-light.png',
        description:
            "From the shadows emerges Luken Dark, a mysterious and cunning champion who harnesses the power of obscurity. Cloaked in darkness, Luken Dark maneuvers through the battlefield, striking unsuspecting foes with a blend of stealth and guile. Their silhouette conceals treacherous intent as they manipulate shadows to confound enemies, making them the epitome of enigmatic malevolence on the elemental stage.",
        stats: {
          statsList[0]: 50,
          statsList[1]: 100,
          statsList[2]: 70,
          statsList[3]: 8,
          statsList[4]: 50,
          statsList[5]: 60
        }));

    fighters.add(FighterModel(
        name: 'Luken Dark',
        category: categories.firstWhere((element) => element.name == 'Dark'),
        image: 'assets/icons/luken-dark.png',
        description:
            "From the shadows emerges Luken Dark, a mysterious and cunning champion who harnesses the power of obscurity. Cloaked in darkness, Luken Dark maneuvers through the battlefield, striking unsuspecting foes with a blend of stealth and guile. Their silhouette conceals treacherous intent as they manipulate shadows to confound enemies, making them the epitome of enigmatic malevolence on the elemental stage.",
        stats: {
          statsList[0]: 80,
          statsList[1]: 40,
          statsList[2]: 40,
          statsList[3]: 8,
          statsList[4]: 20,
          statsList[5]: 70
        }));

    fighters.add(FighterModel(
        name: 'Luken Water',
        category: categories.firstWhere((element) => element.name == 'Water'),
        image: 'assets/icons/luken-water.png',
        description:
            "The arena resonates with the rhythmic flow as Luken Water takes center stage, a champion of fluidity and adaptability. With mastery over aquatic forces, this elemental warrior commands the tides, unleashing waves that drown adversaries in a relentless torrent of power. Luken Water moves like the ebb and flow of the ocean, adapting to any challenge with a fluid grace that confounds foes and makes them an unpredictable force to be reckoned with.",
        stats: {
          statsList[0]: 40,
          statsList[1]: 60,
          statsList[2]: 90,
          statsList[3]: 4,
          statsList[4]: 60,
          statsList[5]: 30
        }));

    fighters.add(FighterModel(
        name: 'Luken Fire',
        category: categories.firstWhere((element) => element.name == 'Fire'),
        image: 'assets/icons/luken-fire.png',
        description:
            "Burning with unbridled passion, Luken Fire ignites the arena with the ferocious might of flames. This elemental champion channels the searing power of fire to scorch enemies and turn the battlefield into a blazing inferno. Armed with a fiery resolve, Luken Fire leaves adversaries in ashes while moving with the relentless intensity of a wildfire, leaving a trail of destruction in their wake.",
        stats: {
          statsList[0]: 40,
          statsList[1]: 60,
          statsList[2]: 40,
          statsList[3]: 5,
          statsList[4]: 30,
          statsList[5]: 40
        }));

    fighters.add(FighterModel(
        name: 'Luken Earth',
        category: categories.firstWhere((element) => element.name == 'Earth'),
        image: 'assets/icons/luken-earth.png',
        description:
            "A stalwart defender on the elemental battleground, Luken Earth stands firm, rooted in unyielding strength. With the solidity of the earth itself, this champion shields allies from harm and crushes adversaries beneath the weight of unrelenting force. Clad in armor hewn from the very bedrock, Luken Earth embodies resilience and fortitude, turning the arena into a domain of unshakeable stability.",
        stats: {
          statsList[0]: 30,
          statsList[1]: 70,
          statsList[2]: 80,
          statsList[3]: 7,
          statsList[4]: 50,
          statsList[5]: 40
        }));

    return fighters;
  }
}
