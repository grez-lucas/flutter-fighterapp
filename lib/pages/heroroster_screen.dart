import 'package:category_app2/models/fighter_model.dart';
import 'package:flutter/material.dart';

class HeroRosterScreen extends StatefulWidget {
  const HeroRosterScreen({Key? key}) : super(key: key);

  @override
  State<HeroRosterScreen> createState() => _HeroRosterScreenState();
}

class _HeroRosterScreenState extends State<HeroRosterScreen> {
  List<FighterModel> fighters = [];

  void _getFighters() {
    fighters = FighterModel.getFighters();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFighters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Roster'),
      ),
      body: Expanded(
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Card(
                color: {
                  'Light': Colors.yellow[100],
                  'Dark': Color.fromARGB(255, 103, 77, 134),
                  'Fire': Colors.orange[100],
                  'Water': Colors.blue[100],
                  'Earth': Colors.brown[200],
                }[fighters[index].category],
                shadowColor: Colors.grey,
                child: Column(
                  children: [
                    ListTile(
                      leading: {
                        'Light': const Icon(Icons.bolt),
                        'Dark': const Icon(Icons.nightlight_round),
                        'Fire': const Icon(Icons.fire_extinguisher),
                        'Water': const Icon(Icons.water),
                        'Earth': const Icon(Icons.eco)
                      }[fighters[index].category],
                    ),
                    Image.asset(
                      fighters[index].image,
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      fighters[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, size: 18),
                        Text(
                          fighters[index].strength.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Icon(Icons.favorite, size: 18),
                        Text(
                          fighters[index].health.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Icon(Icons.speed, size: 18),
                        Text(
                          fighters[index].speed.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Icon(Icons.bolt, size: 18),
                        Text(
                          fighters[index].crit.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Icon(Icons.shield, size: 18),
                        Text(
                          fighters[index].dodge.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8, crossAxisCount: 2),
            itemCount: fighters.length),
      ),
    );
  }
}
