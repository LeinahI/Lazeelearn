import 'package:firebase_auth/firebase_auth.dart';
import 'package:lazeelearn/controllers/auth_controller.dart';
import 'package:lazeelearn/controllers/questions_controller.dart';

import '../../firebase_ref/references.dart';
import 'package:get/get.dart';

extension QuestionsControllerExtension on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions {
    return '$correctQuestionCount out of ${allQuestions.length} are correct';
  }

  String get points {
    var points = (correctQuestionCount / allQuestions.length) *
        100; /*
        (questionPaperModel.timeSeconds - remainSeconds) /
        questionPaperModel.timeSeconds *
        100;*/
    return points.toStringAsFixed(0); /*if = 1 the example points = 10.0 */
  }

  Future<void> saveTestResults() async {
    var batch = fireStore.batch();
    User? _user = Get.find<AuthController>().getUser();
    if (_user == null) return;
    batch.set(
        userRF
            .doc(_user.email)
            .collection('myRecent_tests')
            .doc(questionPaperModel.id),
        {
          "points": points,
          "question_title": questionPaperModel.title,
          "correct_answer": '$correctQuestionCount/${allQuestions.length}',
          "question_id": questionPaperModel.id,
          "time": questionPaperModel.timeSeconds - remainSeconds,
        });
    batch.commit();
    navigateToHome();
  }
}
