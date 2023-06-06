import 'package:lazeelearn/controllers/question_papers/question_paper_controller.dart';
import 'package:lazeelearn/controllers/zoom_drawer_controller.dart';
import 'package:lazeelearn/screens/home/home_screen.dart';
import 'package:lazeelearn/screens/introduction/introduction.dart';
import 'package:lazeelearn/screens/login/login_screen.dart';
import 'package:lazeelearn/screens/questions/answer_check_screen.dart';
import 'package:lazeelearn/screens/questions/questions_screen.dart';
import 'package:lazeelearn/screens/questions/result_screen.dart';
import 'package:lazeelearn/screens/questions/test_overview_screen.dart';
import 'package:lazeelearn/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../controllers/questions_controller.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
          name: "/introduction",
          page: () => const AppIntroductionScreen(),
        ),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => const QuestionsScreen(),
            binding: BindingsBuilder(() {
              Get.put<QuestionsController>(QuestionsController());
            })),
        GetPage(
            name: TestOverviewScreen.routeName,
            page: () => const TestOverviewScreen()),
        GetPage(
            name: ResultScreen.routeName,
            /*rs*/
            page: () => const ResultScreen()),
        GetPage(
            name: AnswerCheckScreen.routeName,
            /*rs*/
            page: () => const AnswerCheckScreen()),
      ];
}
