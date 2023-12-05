import 'package:flutter/material.dart';

import '../models/models.dart';

class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({Key? key}) : super(key: key);

  static final List<FighterModel> fighters = FighterModel.getFighters();

  final int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          backgroundColor: fighters[index].category.bgColor,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              fighters[index].name,
              style: TextStyle(
                color: fighters[index].category.textColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            background: Stack(fit: StackFit.expand, children: [
              Image.asset(
                fighters[index].category.backgroundImage,
                fit: BoxFit.cover,
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
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: Text(
                  fighters[index].description,
                  style: TextStyle(
                    fontSize: 16,
                    color: fighters[index].category.textColor,
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(radius: 5, colors: [
                    fighters[index].category.bgColor,
                    fighters[index].category.bgColor.withOpacity(0.7),
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
                        color: fighters[index].category.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ListView.separated(
                          itemCount: fighters[index].stats.length,
                          shrinkWrap: true,
                          separatorBuilder: (_, __) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (context, index2) {
                            return Card(
                              child: ListTile(
                                  leading: 
                                    fighters[index]
                                        .stats
                                        .keys
                                        .elementAt(index2)
                                        .icon,
                                  iconColor: fighters[index]
                                      .stats
                                      .keys
                                      .elementAt(index2)
                                      .color,
                                  tileColor: fighters[index].category.bgColor,
                                  subtitle: Text(
                                    fighters[index]
                                        .stats
                                        .keys
                                        .elementAt(index2)
                                        .name,
                                    style: TextStyle(
                                      color: fighters[index].category.textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  title: Text(
                                    fighters[index]
                                        .stats
                                        .values
                                        .elementAt(index2)
                                        .toString(),
                                    style: TextStyle(
                                      color: fighters[index]
                                          .stats
                                          .keys
                                          .elementAt(index2)
                                          .color,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            );
                          })
                    ],
                  ))
            ],
          )
        ])),
      ]),
    );
  }
}
