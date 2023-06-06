import 'package:get/get.dart';
import 'package:lazeelearn/controllers/auth_controller.dart';
import 'package:lazeelearn/controllers/theme_controller.dart';

import '../services/firebase_storage_service.dart';

class InitialBindings extends GetxService implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
  }
}
