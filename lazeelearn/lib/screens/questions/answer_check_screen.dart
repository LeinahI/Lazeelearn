import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lazeelearn/configs/themes/app_colors.dart';
import 'package:lazeelearn/configs/themes/custom_text_styles.dart';
import 'package:lazeelearn/controllers/questions_controller.dart';
import 'package:lazeelearn/screens/questions/result_screen.dart';
import 'package:lazeelearn/widgets/common/background_decoration.dart';
import 'package:lazeelearn/widgets/common/custom_app_bar.dart';
import 'package:lazeelearn/widgets/content_area.dart';
import 'package:lazeelearn/widgets/questions/answer_card.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({Key? key}) : super(key: key);
  static const String routeName = "/answercheckscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(
          () => Text(
            'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
            style: appBarTS,
          ),
        ),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgroundDecoration(
          child: Obx(() => Column(
                children: [
                  Expanded(
                      child: ContentArea(
                          child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(controller.currentQuestion.value!.question),
                        GetBuilder<QuestionsController>(
                            id: 'answer_review_list',
                            builder: (_) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];
                                    //
                                    final selectedAnswer = controller
                                        .currentQuestion.value!.selectedAnswer;
                                    //
                                    final correctAnswer = controller
                                        .currentQuestion.value!.correctAnswer;
                                    //
                                    final String answerText =
                                        '${answer.identifier}. ${answer.answer}';
                                    if (correctAnswer == selectedAnswer &&
                                        answer.identifier == selectedAnswer) {
                                      //correct
                                      return CorrectAnswer(answer: answerText);
                                    } else if (selectedAnswer == null) {
                                      //not ans
                                      return NotAnswered(answer: answerText);
                                    } else if (correctAnswer !=
                                            selectedAnswer &&
                                        answer.identifier == selectedAnswer) {
                                      //wrong
                                      return WrongAnswer(answer: answerText);
                                    } else if (correctAnswer ==
                                        answer.identifier) {
                                      //correct
                                      return CorrectAnswer(answer: answerText);
                                    }
                                    return AnswerCard(
                                      answer: answerText,
                                      onTap: () {},
                                      isSelected: false,
                                    );
                                  },
                                  separatorBuilder: (_, index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length);
                            })
                      ],
                    ),
                  )))
                ],
              ))),
    );
  }
}
