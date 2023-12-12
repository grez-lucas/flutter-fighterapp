import 'package:category_app2/models/fighter_model.dart';
import 'package:flutter/material.dart';

import '../widgets/app_widgets.dart';

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
                return FighterCard(fighter: fighters[index]);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7, crossAxisCount: 2),
              itemCount: fighters.length),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple[600],
          onPressed: () {
            Navigator.pushNamed(context, '/createfighter');
          },
          child: const Icon(Icons.add),
        ));
  }
}
