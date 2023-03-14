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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBxM94teN46boqcrYjrwOcOgHCg8a_ZV1k',
    appId: '1:480321848468:web:42174b14daf60d8937a081',
    messagingSenderId: '480321848468',
    projectId: 'whaletunes-3bf8e',
    authDomain: 'whaletunes-3bf8e.firebaseapp.com',
    storageBucket: 'whaletunes-3bf8e.appspot.com',
    measurementId: 'G-8KNYN6MCK8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9KPXqmK7RJx8tUipAQ8UjZ_H7DmIw008',
    appId: '1:480321848468:android:b49dbf84be23950b37a081',
    messagingSenderId: '480321848468',
    projectId: 'whaletunes-3bf8e',
    storageBucket: 'whaletunes-3bf8e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-wno387RulinzAh9r2gdmJZ9qMgGS_Eg',
    appId: '1:480321848468:ios:273eea5a0da99b2d37a081',
    messagingSenderId: '480321848468',
    projectId: 'whaletunes-3bf8e',
    storageBucket: 'whaletunes-3bf8e.appspot.com',
    androidClientId: '480321848468-ai883tgeekm28o8srksi2k9aooc3j9q7.apps.googleusercontent.com',
    iosClientId: '480321848468-vmp603v2lpbbnm0locjrtb11p7ge38uu.apps.googleusercontent.com',
    iosBundleId: 'com.mikesapplication.app',
  );
}
