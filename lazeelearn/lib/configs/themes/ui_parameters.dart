import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double mmobileScreenPadding = 25.0;
const double ccardBorderRadius = 10.0;

double get mobileScreenPadding => mmobileScreenPadding;
double get cardBorderRadius => ccardBorderRadius;

class UIParameters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(ccardBorderRadius);

  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(mmobileScreenPadding);

  static bool isDarkMode() {
    return Get.isDarkMode ? true : false;
  }
}
