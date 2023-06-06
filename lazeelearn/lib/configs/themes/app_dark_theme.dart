import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazeelearn/configs/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColorDark = Color.fromRGBO(60, 16, 83, 1);
const Color primaryColorDark = Color.fromRGBO(173, 83, 137, 1);
const Color mainTextColorDark = Color.fromRGBO(255, 255, 255, 1);

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        primaryColor: primaryColorDark,
        iconTheme: getIconTheme(),
        textTheme: getTextTheme().apply(
            bodyColor: mainTextColorDark, displayColor: mainTextColorDark));
  }
}
