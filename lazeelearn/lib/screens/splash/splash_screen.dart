import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lazeelearn/configs/themes/app_colors.dart';
import 'package:lazeelearn/controllers/question_papers/data_uploader.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  // DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center, //align center the image
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Image.asset(
        "assets/images/new_logo.png", //app_splash_logo.png
        width: 380,
        height: 400,
      ), //locate image
    ));
  }
}
