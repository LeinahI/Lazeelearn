import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lazeelearn/controllers/question_papers/data_uploader.dart';
import 'package:lazeelearn/firebase_ref/references.dart';
import 'package:lazeelearn/screens/home/home_screen.dart';
import 'package:lazeelearn/screens/login/login_screen.dart';
import 'package:lazeelearn/utils/app_logger.dart';

import '../widgets/dialogs/dialogue_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    //Para mag upload yung json sa firebase
    /*DataUploader controller =*/ Get.put(DataUploader());
    navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authaccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authaccount.idToken,
            accessToken: _authaccount.accessToken);

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } on Exception catch (error) {
      AppLogger.e(error);
    }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  Future<void> signOut() async {
    AppLogger.d('Sign out');
    navigateToHomePage();
    //print("naka sign out na ya");
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToIntroduction() async {
    Get.offAllNamed("/introduction");
  }

  navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  void showLoginAlertDialogue() {
    Get.dialog(Dialogs.questionStartDialogue(onTap: () {
      Get.back();
      navigateToLoginPage();
    }), barrierDismissible: false);
  }

  void navigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
