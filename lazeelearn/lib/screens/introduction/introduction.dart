import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lazeelearn/configs/themes/app_colors.dart';
import 'package:lazeelearn/screens/home/home_screen.dart';
import 'package:lazeelearn/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: mainGradient()),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //Align the everything on the middle axis
          const Icon(
            Icons.star,
            size: 65,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          const SizedBox(height: 40),
          const Text(
            "This Lazeelearn app. I developed this using Flutter and Firebase. I'm a lazy college student and have a short-term memory, just to prepare myself for incoming quizzes and exams.",
            style: TextStyle(
                fontSize: 17,
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          AppCircleButton(
              onTap: () => Get.offAndToNamed("/home"),
              child: const Icon(Icons.arrow_forward, size: 65))
        ]),
      ),
    ));
  }
}
