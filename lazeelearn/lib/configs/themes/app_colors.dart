import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazeelearn/configs/themes/app_dark_theme.dart';
import 'package:lazeelearn/configs/themes/app_light_theme.dart';
import 'package:flutter/rendering.dart';
import 'package:lazeelearn/configs/themes/ui_parameters.dart';
import 'package:get/get.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xFFC7E8CA);
const Color wrongAnswerColor = Color.fromARGB(255, 250, 130, 150);
const Color notAnsweredColor = Color(0xFF2a3c65);

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

LinearGradient mainGradient() => UIParameters.isDarkMode()
    ? mainGradientDark
    : mainGradientLight; //if true = darkmode otherwise lightmode

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? const Color.fromARGB(255, 46, 60, 98) //2E3C62
    : const Color.fromARGB(255, 247, 234, 247); //F7EAF7

Color answerSelectedColor() => UIParameters.isDarkMode()
    ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
    : Theme.of(Get.context!).primaryColor;

Color answerBorderColor() => UIParameters.isDarkMode()
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
