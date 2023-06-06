import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazeelearn/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color.fromRGBO(221, 214, 243, 1); //DDD6F3
const Color primaryColorLight = Color.fromRGBO(250, 172, 168, 1); //FAACA8
const Color mainTextColorLight = Color.fromRGBO(40, 40, 40, 1); //282828
const Color cardColor = Color.fromARGB(255, 254, 254, 255); //FEFEFF

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: primaryColorLight,
        iconTheme: getIconTheme(),
        cardColor: cardColor,
        textTheme: getTextTheme().apply(
            bodyColor: mainTextColorLight, displayColor: mainTextColorLight));
  }
}
