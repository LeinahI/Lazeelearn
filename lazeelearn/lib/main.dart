import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lazeelearn/bindings/initial_bindigns.dart';
import 'package:lazeelearn/configs/themes/app_dark_theme.dart';
import 'package:lazeelearn/controllers/theme_controller.dart';
import 'package:lazeelearn/data_uploader_screen.dart';
import 'package:get/get.dart';
import 'package:lazeelearn/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lazeelearn/routes/app_routes.dart';
import 'package:lazeelearn/screens/introduction/introduction.dart';
import 'package:lazeelearn/screens/splash/splash_screen.dart';

import 'configs/themes/app_light_theme.dart';
import 'controllers/question_papers/data_uploader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme, //light
      getPages: AppRoutes.routes(),
    );
  }
}
/*
Future<void> main() async {
  //Upload json data to the firebase db
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(home: DataUploaderScreen()));
}*/
