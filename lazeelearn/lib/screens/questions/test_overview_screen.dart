import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lazeelearn/configs/themes/custom_text_styles.dart';
import 'package:lazeelearn/configs/themes/ui_parameters.dart';
import 'package:lazeelearn/controllers/questions_controller.dart';
import 'package:lazeelearn/screens/home/question_card.dart';
import 'package:lazeelearn/widgets/common/background_decoration.dart';
import 'package:lazeelearn/widgets/common/custom_app_bar.dart';
import 'package:lazeelearn/widgets/common/main_button.dart';
import 'package:lazeelearn/widgets/content_area.dart';
import 'package:lazeelearn/widgets/questions/countdown_timer.dart';
import 'package:lazeelearn/widgets/questions/question_number_card.dart';

import '../../widgets/questions/answer_card.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({Key? key}) : super(key: key);
  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
            child: Column(
              children: [
                Row(
                  children: [
                    CountdownTimer(
                        color: UIParameters.isDarkMode()
                            ? Theme.of(context).textTheme.bodyLarge!.color
                            : Theme.of(context).primaryColor,
                        time: ''),
                    Obx(() => Text(
                          '${controller.time} Remaining',
                          style: countDownTimerTs(),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: GridView.builder(
                        itemCount: controller.allQuestions.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 75,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                        itemBuilder: (_, index) {
                          AnswerStatus? _answerstatus;
                          if (controller.allQuestions[index].selectedAnswer !=
                              null) {
                            _answerstatus = AnswerStatus.answered;
                          }
                          return QuestionNumberCard(
                              index: index + 1,
                              status: _answerstatus,
                              onTap: () => controller.jumpToQuestion(index));
                        }))
              ],
            ),
          )),
          ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
                padding: UIParameters.mobileScreenPadding,
                child: MainButton(
                  onTap: () {
                    controller.complete();
                  },
                  title: "Complete",
                  color: const Color(0xFFF7EAF7),
                )),
          )
        ],
      )),
    );
  }
}
