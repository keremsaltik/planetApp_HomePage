import 'package:flutter/material.dart';

class otherPlanets {
  String title;
  String describeText;
  String iconPath;
  Color boxColor;
  otherPlanets({
    required this.title,
    required this.describeText,
    required this.iconPath,
    required this.boxColor,
  });

  static List<otherPlanets> getotherplanets() {
    List<otherPlanets> oplanets = [];

    oplanets.add(
      otherPlanets(
        title: 'Jupiter',
        describeText: 'Biggest planet!',
        iconPath: 'assets/png/jupiter.png',
        boxColor: Colors.brown,
      ),
    );

    oplanets.add(
      otherPlanets(
        title: 'Mercury',
        describeText: 'Smallest',
        iconPath: 'assets/png/mercury.png',
        boxColor: Colors.blueAccent,
      ),
    );

    oplanets.add(
      otherPlanets(
        title: 'Saturn',
        describeText: 'Like a beyblade',
        iconPath: 'assets/png/saturn.png',
        boxColor: const Color.fromARGB(255, 218, 125, 91),
      ),
    );
    return oplanets;
  }
}
