import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lazeelearn/configs/themes/custom_text_styles.dart';
import 'package:lazeelearn/configs/themes/ui_parameters.dart';
import 'package:lazeelearn/controllers/question_papers/question_paper_controller.dart';
import 'package:lazeelearn/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:lazeelearn/widgets/app_icon_text.dart';

import '../../configs/themes/app_icons.dart';

class QuestionCard extends GetView<QuizPaperController> {
  const QuestionCard({Key? key, required this.model}) : super(key: key);

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: Theme.of(context).cardColor),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestions(
            paper: model,
            tryAgain: false,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(15), //the high val = circle
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      child: SizedBox(
                        height: Get.width * 0.15,
                        width: Get.width * 0.15,
                        /*child: CachedNetworkImage(
                            imageUrl:
                                imgquestionPaperController.allPapers[index].imagesUrl!,
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset("assets/images/app_splash_logo.png"),
                          ),*/
                        child: FadeInImage(
                          image: NetworkImage(model.imagesUrl!),
                          placeholder: const AssetImage(
                              "assets/images/app_splash_logo.png"), //app_splash_logo.png
                        ),
                      ),
                    ),
                  ),
                  //Title & description start
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cardTitles(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(model.description),
                        ),
                        Row(
                          children: [
                            //questionmark
                            AppIconText(
                                icon: Icon(
                                  Icons.help_outline_sharp,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                                text: Text(
                                  '${model.questionsCount} questions',
                                  style: detailText.copyWith(
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                )),
                            //timer
                            const SizedBox(width: 15),
                            AppIconText(
                                icon: Icon(
                                  Icons.timer,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                                text: Text(
                                  model.timeInMinits(),
                                  style: detailText.copyWith(
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  //Title & description end
                ],
              ),
              Positioned(
                  bottom: -_padding,
                  right: -_padding,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cardBorderRadius),
                              bottomRight: Radius.circular(cardBorderRadius)),
                          color: Theme.of(context).primaryColor),
                      child: const Icon(AppIcons.trophyOutline),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
