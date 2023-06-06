import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lazeelearn/configs/themes/app_colors.dart';
import 'package:lazeelearn/configs/themes/ui_parameters.dart';
import 'package:lazeelearn/controllers/zoom_drawer_controller.dart';
import 'package:get/get.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      foregroundColor /*primary*/ : onSurfaceTextColor))),
          child: SafeArea(
              child: Stack(
            children: [
              /* const Positioned(
                  top: 0,
                  left: -23, //nakatago na to man
                  child: BackButton(
                    color: Colors.white,
                    /*onPressed: () {
                        //print("You tapped the back button");
                        controller.toggleDrawer();
                      }*/
                  )),*/
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.1, top: 50),
                child: Column(
                  children: [
                    Obx(() => controller.user.value == null
                        ? const SizedBox()
                        : Text(
                            controller.user.value!.displayName ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: onSurfaceTextColor,
                            ),
                          )),
                    const Spacer(
                      flex: 1,
                    ),
                    DrawersButton(
                      icon: Icons.web,
                      label: "Github",
                      onPressed: () => controller.website(),
                    ),
                    DrawersButton(
                      icon: Icons.facebook,
                      label: "facebook",
                      onPressed: () => controller.faceBook(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: DrawersButton(
                        icon: Icons.email,
                        label: "email",
                        onPressed: () => controller.email(),
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    DrawersButton(
                      icon: Icons.logout,
                      label: "Sign Out",
                      snackSignOut: const SnackBar(
                        content: Text('You have been signed out'),
                        behavior: SnackBarBehavior.floating,
                        elevation: 0,
                      ),
                      onPressed: () => controller.signOut(),
                    )
                  ],
                ),
              )
            ],
          ))),
    );
  }
}

class DrawersButton extends StatelessWidget {
  const DrawersButton({
    Key? key,
    required this.icon,
    required this.label,
    this.snackSignOut,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final SnackBar? snackSignOut;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 15,
        ),
        label: Text(label));
  }
}
/*Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                      color: Colors.white,
                      onPressed: () {
                        //print("You tapped the back button");
                        controller.toggleDrawer();
                      })) */
