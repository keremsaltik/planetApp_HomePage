import 'package:flutter/material.dart';

class mainPlanets {
  String title;
  String describeText;
  String iconPath;
  Color boxColor;
  mainPlanets({
    required this.title,
    required this.describeText,
    required this.iconPath,
    required this.boxColor,
  });

  static List<mainPlanets> getmainplanets() {
    List<mainPlanets> planets = [];

    planets.add(
      mainPlanets(
        title: 'Pluto',
        describeText: 'The minor Planet',
        iconPath: 'assets/png/pluto.png',
        boxColor: Colors.orangeAccent,
      ),
    );
    planets.add(mainPlanets(
      title: 'Neptune',
      describeText: 'Eight & farthest - ',
      iconPath: 'assets/png/neptune.png',
      boxColor: Colors.deepPurple,
    ));

    planets.add(
      mainPlanets(
        title: 'Earth',
        describeText: 'You can live there',
        iconPath: 'assets/png/earth.png',
        boxColor: Colors.blue,
      ),
    );
    return planets;
  }
}
