import 'package:flutter/material.dart';

class ScreenUtils {
  static double scaleWidth(BuildContext context, double? value) {
    return MediaQuery.of(context).size.width * (value ?? 1);
  }

  static double scaleHeight(BuildContext context, double? value) {
    return MediaQuery.of(context).size.height * (value ?? 1);
  }
}
