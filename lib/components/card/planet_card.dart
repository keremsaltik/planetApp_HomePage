import 'package:flutter/material.dart';
import 'package:planet_app/pages/planets/mainPlanets.dart';
import 'package:planet_app/utilities/screen_utilities.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({
    super.key,
    required this.lPlanets,
    required this.isMainPlanets,
  });

  final List lPlanets;
  final bool isMainPlanets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: lPlanets.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(bottom: 40),
          margin: isMainPlanets ? null : const EdgeInsets.only(left: 20),
          width: isMainPlanets
              ? ScreenUtils.scaleWidth(context, 0.45)
              : ScreenUtils.scaleWidth(context, 0.38),
          child: Card(
            margin: isMainPlanets
                ? null
                : const EdgeInsets.only(
                    bottom: 30,
                  ),
            color: lPlanets[index].boxColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  lPlanets[index].iconPath,
                  fit: BoxFit.cover,
                  width: 125,
                ),
                Text(
                  lPlanets[index].title,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  lPlanets[index].describeText,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
