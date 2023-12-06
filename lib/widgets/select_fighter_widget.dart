import 'package:flutter/material.dart';

import '../models/models.dart';

class SelectFighter extends StatelessWidget {
  const SelectFighter({
    super.key,
    required this.fighters,
    required this.index,
  });

  final List<FighterModel> fighters;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Image.asset(
        fighters[index].category.backgroundImage,
        fit: BoxFit.cover,
      ),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            fighters[index].image,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 10),
        child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              fighters[index].name,
              style: const TextStyle(
                shadows: [
                  Shadow(
                      color: Colors.black, offset: Offset(1, 1), blurRadius: 2)
                ],
                color: Colors.white,
                fontSize: 20,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 2,
                fontWeight: FontWeight.bold,
              ),
            )),
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
    ]);
  }
}
