//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lazeelearn/configs/themes/app_colors.dart';
import 'package:lazeelearn/configs/themes/app_icons.dart';
import 'package:lazeelearn/configs/themes/custom_text_styles.dart';
import 'package:lazeelearn/configs/themes/ui_parameters.dart';
import 'package:lazeelearn/controllers/question_papers/question_paper_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lazeelearn/controllers/zoom_drawer_controller.dart';
import 'package:lazeelearn/screens/home/menu_screen.dart';
import 'package:lazeelearn/screens/home/question_card.dart';
import 'package:lazeelearn/services/firebase_storage_service.dart';
import 'package:get/get.dart';
import 'package:lazeelearn/widgets/app_circle_button.dart';
import 'package:lazeelearn/widgets/content_area.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuizPaperController imgquestionPaperController = Get.find();
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(
      builder: (_) {
        return ZoomDrawer(
          borderRadius: -1,
          controller: _.zoomDrawerController,
          angle: 0.0,
          mainScreenOverlayColor: Colors.black.withOpacity(0.15),
          style: DrawerStyle.style1,
          mainScreenTapClose: true,
          menuBackgroundColor: Colors.black.withOpacity(0.0),
          slideWidth: MediaQuery.of(context).size.width * 0.75,
          menuScreen: const MyMenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          onTap: controller.toggleDrawer,
                          child: const Icon(AppIcons.menuLeft,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: const [
                              Icon(
                                AppIcons.peace,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                "Hello Ya",
                                style: userFontName,
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Ano re-reviewhin mo ngayon ya?",
                          style: headerText,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    //Yung color neto napapalitan sa content_area.dart
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(() => ListView.separated(
                            padding: UIParameters.mobileScreenPadding,
                            //shrinkWrap: true,

                            itemBuilder: (BuildContext context, int index) {
                              //bago tong QuestionCard
                              return QuestionCard(
                                  model: imgquestionPaperController
                                      .allPapers[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 20);
                            },
                            itemCount: imgquestionPaperController
                                .allPaperImages.length)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}

/*
ClipRRect(
                child: SizedBox(
                  height: 200,
                  width: 200,
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
                    image: NetworkImage(
                        imgquestionPaperController.allPaperImages[index]),
                    placeholder:
                        const AssetImage("assets/images/app_splash_logo.png"),
                  ),
                ),
              );
*/