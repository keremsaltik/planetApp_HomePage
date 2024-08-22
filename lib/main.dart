import 'package:flutter/material.dart';
import 'package:planet_app/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all<Color>(Colors.black),
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(surface: Colors.black),
        useMaterial3: true,
        iconTheme: const IconThemeData(color: Colors.white),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const homePage(),
    );
  }
}
