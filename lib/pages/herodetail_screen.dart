import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/app_widgets.dart';

class HeroDetailScreen extends StatelessWidget {
  final FighterModel fighter;
  
  const HeroDetailScreen({
    Key? key,
    required this.fighter,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          backgroundColor: fighter.category.bgColor,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              fighter.name,
              style: TextStyle(
                color: fighter.category.textColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            background: Stack(fit: StackFit.expand, children: [
              Image.asset(
                fighter.category.backgroundImage,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset(
                    fighter.image,
                  ),
                ),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, 0.5),
                    end: Alignment(0.0, 0.0),
                    colors: <Color>[
                      Color(0x60000000),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: Text(
                  fighter.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: fighter.category.textColor,
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(radius: 5, colors: [
                    fighter.category.bgColor,
                    fighter.category.bgColor.withOpacity(0.7),
                    Colors.grey[900]!,
                  ], stops: const [
                    0,
                    0.3,
                    1.0
                  ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Powers and Ablities',
                      style: TextStyle(
                        fontSize: 14,
                        color: fighter.category.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [StatColumn(fighter: fighter)],
                  ))
            ],
          )
        ])),
      ]),
    );
  }
}
