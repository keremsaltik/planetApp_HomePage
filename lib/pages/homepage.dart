// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:planet_app/pages/planets/mainPlanets.dart';
import 'package:planet_app/pages/planets/otherPlanets.dart';

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

  void _getInitialInfo() {
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
    _getInitialInfo();
    _getotherplanets();
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 10),
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
            padding: EdgeInsets.only(left: 20),
            child: Text(
              bodyText,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.all(23),
            child: _textField(textFieldText: textFieldText),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              margin: EdgeInsets.only(left: 13),
              child: Row(
                children: [
                  Text(
                    mostPopular,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Icon(
                    Icons.chevron_right,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: _popularPlanets(planets: planets),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(bottom: 10, left: 13),
            child: TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    alsoLike,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Icon(
                    Icons.chevron_right,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: _otherPlanets(oplanets: oplanets),
            ),
          ),
          _bottomNavigationBar()
        ],
      ),
    );
  }
}

class _otherPlanets extends StatelessWidget {
  const _otherPlanets({
    super.key,
    required this.oplanets,
  });

  final List<otherPlanets> oplanets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: oplanets.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(bottom: 40),
          margin: EdgeInsets.only(left: 20),
          width: 150,
          child: Card(
            margin: EdgeInsets.only(
              bottom: 30,
            ),
            color: oplanets[index].boxColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  oplanets[index].iconPath,
                  fit: BoxFit.cover,
                  width: 125,
                ),
                Text(
                  oplanets[index].title,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  oplanets[index].describeText,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _bottomNavigationBar extends StatelessWidget {
  const _bottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      elevation: 10,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.compass_calibration), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.heart_broken), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ],
    );
  }
}

class _popularPlanets extends StatelessWidget {
  const _popularPlanets({
    super.key,
    required this.planets,
  });

  final List<mainPlanets> planets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: planets.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20),
            width: 200,
            child: Card(
              color: planets[index].boxColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Image.asset(
                    planets[index].iconPath,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    planets[index].title,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    planets[index].describeText,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class _textField extends StatelessWidget {
  const _textField({
    super.key,
    required this.textFieldText,
  });

  final String textFieldText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.all(8),
        hintText: textFieldText,
        hintMaxLines: 1,
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
