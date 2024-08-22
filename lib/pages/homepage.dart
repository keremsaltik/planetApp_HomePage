// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:planet_app/components/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:planet_app/components/card/planet_card.dart';
import 'package:planet_app/components/textField/textfield.dart';
import 'package:planet_app/pages/planets/mainPlanets.dart';
import 'package:planet_app/pages/planets/otherPlanets.dart';
import 'package:planet_app/utilities/screen_utilities.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<mainPlanets> planets = [];
  List<otherPlanets> oplanets = [];

  void _getotherplanets() {
    oplanets = otherPlanets.getotherplanets();
  }

  void _getMainPlanets() {
    planets = mainPlanets.getmainplanets();
  }

  final String titleText = "Let's Explore";
  final String profilePhotoLocation = 'assets/jpg/profile_photo.jpg';
  final String bodyText = 'The milky way galaxy';
  final String textFieldText = 'Search for your favorite planet';
  final String mostPopular = 'Most Popular';
  final String alsoLike = 'You may also like';

  @override
  Widget build(BuildContext context) {
    _getMainPlanets();
    _getotherplanets();
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: ScreenUtils.scaleHeight(context, 0.055),
                right: ScreenUtils.scaleWidth(context, 0.05),
                left: ScreenUtils.scaleWidth(context, 0.05)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titleText,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(profilePhotoLocation),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding:
                EdgeInsets.only(left: ScreenUtils.scaleWidth(context, 0.05)),
            child: Text(
              bodyText,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(23),
            child: textField(textFieldText: textFieldText),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              margin:
                  EdgeInsets.only(left: ScreenUtils.scaleWidth(context, 0.03)),
              child: Row(
                children: [
                  Text(
                    mostPopular,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Icon(
                    Icons.chevron_right,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PlanetCard(lPlanets: planets, isMainPlanets: true),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                bottom: ScreenUtils.scaleWidth(context, 0.05),
                left: ScreenUtils.scaleWidth(context, 0.03)),
            child: TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    alsoLike,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Icon(
                    Icons.chevron_right,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PlanetCard(lPlanets: oplanets, isMainPlanets: false),
          ),
          const bottomNavigationBar()
        ],
      ),
    );
  }
}
