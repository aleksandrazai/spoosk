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
    apiKey: 'AIzaSyBUlAQ0ZGndcHyuw9RP8ppDiOZwbOU0-oU',
    appId: '1:173950954451:web:c55adef2416ff08efedd26',
    messagingSenderId: '173950954451',
    projectId: 'spoosk-c0b68',
    authDomain: 'spoosk-c0b68.firebaseapp.com',
    storageBucket: 'spoosk-c0b68.appspot.com',
    measurementId: 'G-7S8W9KSD5Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhDHNP6v54jhf4sL62sY8i49m-3T_6bPQ',
    appId: '1:173950954451:android:11a62f52deff2cb1fedd26',
    messagingSenderId: '173950954451',
    projectId: 'spoosk-c0b68',
    storageBucket: 'spoosk-c0b68.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrW7rjjr7uePdyA0sRbvGBqY48SVtxBuM',
    appId: '1:173950954451:ios:997cbae9330c3ccffedd26',
    messagingSenderId: '173950954451',
    projectId: 'spoosk-c0b68',
    storageBucket: 'spoosk-c0b68.appspot.com',
    iosBundleId: 'com.example.spoosk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBrW7rjjr7uePdyA0sRbvGBqY48SVtxBuM',
    appId: '1:173950954451:ios:b354f26120f27319fedd26',
    messagingSenderId: '173950954451',
    projectId: 'spoosk-c0b68',
    storageBucket: 'spoosk-c0b68.appspot.com',
    iosBundleId: 'com.example.spoosk.RunnerTests',
  );
}