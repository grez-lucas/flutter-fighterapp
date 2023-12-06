import 'category_model.dart';
import 'stat_model.dart';

class FighterModel {
  String name;
  CategoryModel category;
  String image;
  String description;
  FighterStats stats;

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
    return stats.health.value > 0;
  }

  List<FighterStat> getStatsList() {
    return [
      stats.strength,
      stats.health,
      stats.speed,
      stats.crit,
      stats.dodge,
      stats.defense,
    ];
  }

  static List<FighterModel> getFighters() {
    List<FighterModel> fighters = [];
    List<StatModel> statsList = StatModel.getStats();

    fighters.add(FighterModel(
      name: 'Luken Light',
      category: categories.firstWhere((element) => element.name == 'Light'),
      image: 'assets/icons/luken-light.png',
      description: "...",
      stats: FighterStats(
        strength: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Strength'),
            value: 50),
        health: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Health'),
            value: 100),
        speed: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Speed'),
            value: 70),
        crit: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Crit'),
            value: 8),
        dodge: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Dodge'),
            value: 50),
        defense: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Defense'),
            value: 60),
      ),
    ));

    fighters.add(FighterModel(
      name: 'Luken Dark',
      category: categories.firstWhere((element) => element.name == 'Dark'),
      image: 'assets/icons/luken-dark.png',
      description: "...",
      stats: FighterStats(
        strength: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Strength'),
            value: 80),
        health: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Health'),
            value: 40),
        speed: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Speed'),
            value: 40),
        crit: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Crit'),
            value: 8),
        dodge: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Dodge'),
            value: 50),
        defense: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Defense'),
            value: 60),
      ),
    ));

    fighters.add(FighterModel(
      name: 'Luken Water',
      category: categories.firstWhere((element) => element.name == 'Water'),
      image: 'assets/icons/luken-water.png',
      description: "...",
      stats: FighterStats(
        strength: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Strength'),
            value: 40),
        health: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Health'),
            value: 60),
        speed: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Speed'),
            value: 90),
        crit: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Crit'),
            value: 4),
        dodge: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Dodge'),
            value: 60),
        defense: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Defense'),
            value: 30),
      ),
    ));

    fighters.add(FighterModel(
      name: 'Luken Fire',
      category: categories.firstWhere((element) => element.name == 'Fire'),
      image: 'assets/icons/luken-fire.png',
      description: "...",
      stats: FighterStats(
        strength: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Strength'),
            value: 80),
        health: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Health'),
            value: 40),
        speed: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Speed'),
            value: 40),
        crit: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Crit'),
            value: 8),
        dodge: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Dodge'),
            value: 50),
        defense: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Defense'),
            value: 60),
      ),
    ));

    fighters.add(FighterModel(
      name: 'Luken Earth',
      category: categories.firstWhere((element) => element.name == 'Earth'),
      image: 'assets/icons/luken-earth.png',
      description: "...",
      stats: FighterStats(
        strength: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Strength'),
            value: 70),
        health: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Health'),
            value: 100),
        speed: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Speed'),
            value: 50),
        crit: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Crit'),
            value: 6),
        dodge: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Dodge'),
            value: 40),
        defense: FighterStat(
            statModel:
                statsList.firstWhere((element) => element.name == 'Defense'),
            value: 80),
      ),
    ));

    return fighters;
  }
}

class FighterStat {
  final StatModel statModel;
  int value;

  FighterStat({
    required this.statModel,
    required this.value,
  });
}

class FighterStats {
  final FighterStat strength;
  FighterStat health;
  final FighterStat speed;
  final FighterStat crit;
  final FighterStat dodge;
  final FighterStat defense;

  FighterStats({
    required this.strength,
    required this.health,
    required this.speed,
    required this.crit,
    required this.dodge,
    required this.defense,
  });
}
