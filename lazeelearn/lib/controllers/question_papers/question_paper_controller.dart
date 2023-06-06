import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lazeelearn/controllers/auth_controller.dart';
import 'package:lazeelearn/firebase_ref/references.dart';
import 'package:lazeelearn/models/question_paper_model.dart';
import 'package:lazeelearn/screens/questions/questions_screen.dart';
import 'package:lazeelearn/services/firebase_storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lazeelearn/utils/app_logger.dart';

//New Changes refactoring
class QuizPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs; //bago to

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    /*List<String> imgName = [
      //Yung name ng image files sa firebase, dapat match dito
      "biology", //
      "chemistry", //
      "maths", //
      "physics", //
    ];*/

    try {
      //bago to start
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);
      //bago to end

      for (var paper in paperList /*var img in imgName*/) {
        final imgUrl = await Get.find<FirebaseStorageService>()
            .getImage(paper.title /*img*/);
        paper.imagesUrl = imgUrl; //bago to
        allPaperImages.add(imgUrl!); //tanggal to
      }
      //allPapers.assignAll(paperList); //bago to
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authcontroller = Get.find();
    if (_authcontroller.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        Get.offNamed(QuestionsScreen.routeName,
            arguments: paper, preventDuplicates: false);
      } else {
        //print("logged in na");
        Get.toNamed(QuestionsScreen.routeName, arguments: paper);
      }
    } else {
      print('The title is ${paper.title}');
      _authcontroller.showLoginAlertDialogue();
    }
  }
}
