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

  FighterModel.copy(FighterModel source)
      : this(
          name: source.name,
          category: source.category,
          image: source.image,
          description: source.description,
          stats: FighterStats.copy(source.stats),
        );

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
      description:
          "In the realm of elemental champions, Luken Light emerges as the embodiment of virtue and luminosity. Radiating an aura of righteousness, Luken Light wields the power of illumination, casting blinding rays upon adversaries and standing as a beacon of hope. With a sword forged from the essence of pure light, this champion fights for justice, blinding enemies with their brilliance while empowering allies with the warmth of celestial energy.",
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
      description:
          "From the shadows emerges Luken Dark, a mysterious and cunning champion who harnesses the power of obscurity. Cloaked in darkness, Luken Dark maneuvers through the battlefield, striking unsuspecting foes with a blend of stealth and guile. Their silhouette conceals treacherous intent as they manipulate shadows to confound enemies, making them the epitome of enigmatic malevolence on the elemental stage.",
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
      description:
          "The arena resonates with the rhythmic flow as Luken Water takes center stage, a champion of fluidity and adaptability. With mastery over aquatic forces, this elemental warrior commands the tides, unleashing waves that drown adversaries in a relentless torrent of power. Luken Water moves like the ebb and flow of the ocean, adapting to any challenge with a fluid grace that confounds foes and makes them an unpredictable force to be reckoned with.",
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
      description:
          "Burning with unbridled passion, Luken Fire ignites the arena with the ferocious might of flames. This elemental champion channels the searing power of fire to scorch enemies and turn the battlefield into a blazing inferno. Armed with a fiery resolve, Luken Fire leaves adversaries in ashes while moving with the relentless intensity of a wildfire, leaving a trail of destruction in their wake.",
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
      description:
          "A stalwart defender on the elemental battleground, Luken Earth stands firm, rooted in unyielding strength. With the solidity of the earth itself, this champion shields allies from harm and crushes adversaries beneath the weight of unrelenting force. Clad in armor hewn from the very bedrock, Luken Earth embodies resilience and fortitude, turning the arena into a domain of unshakeable stability.",
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

  FighterStat.copy(FighterStat source)
      : this(
          statModel: source.statModel, // Assuming StatModel is immutable
          value: source.value,
        );
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

  FighterStats.copy(FighterStats source)
      : this(
          strength: FighterStat.copy(source.strength),
          health: FighterStat.copy(source.health),
          speed: FighterStat.copy(source.speed),
          crit: FighterStat.copy(source.crit),
          dodge: FighterStat.copy(source.dodge),
          defense: FighterStat.copy(source.defense),
        );
}
