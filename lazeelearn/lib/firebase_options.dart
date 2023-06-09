// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAPD2sLv5KctEn2rAlsIjKbhUiImQeDY38',
    appId: '1:702372677977:web:eebab67671b562f1eae448',
    messagingSenderId: '702372677977',
    projectId: 'lazeelearn',
    authDomain: 'lazeelearn.firebaseapp.com',
    storageBucket: 'lazeelearn.appspot.com',
    measurementId: 'G-7J85ET4WYP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQByX1gGnoZ5HaKBBmHZScFRUmPay5_ok',
    appId: '1:702372677977:android:9c01cdf98d9e6900eae448',
    messagingSenderId: '702372677977',
    projectId: 'lazeelearn',
    storageBucket: 'lazeelearn.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArVQ9LHdbP9OklAGJrugHPnjPkVb1-15I',
    appId: '1:702372677977:ios:bae133226aeb261ceae448',
    messagingSenderId: '702372677977',
    projectId: 'lazeelearn',
    storageBucket: 'lazeelearn.appspot.com',
    iosClientId: '702372677977-mq14dcfncb9h9mb1bfpisf983d2jr7qn.apps.googleusercontent.com',
    iosBundleId: 'com.example.lazeelearn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArVQ9LHdbP9OklAGJrugHPnjPkVb1-15I',
    appId: '1:702372677977:ios:bae133226aeb261ceae448',
    messagingSenderId: '702372677977',
    projectId: 'lazeelearn',
    storageBucket: 'lazeelearn.appspot.com',
    iosClientId: '702372677977-mq14dcfncb9h9mb1bfpisf983d2jr7qn.apps.googleusercontent.com',
    iosBundleId: 'com.example.lazeelearn',
  );
}
