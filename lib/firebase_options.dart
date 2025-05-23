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
    apiKey: 'AIzaSyCPzAI9QoeweueTdDeSSZOFHyKqLHjDRTI',
    appId: '1:607661121053:web:54a4b89bdff543056fb0f4',
    messagingSenderId: '607661121053',
    projectId: 'penal-code-7d5f4',
    authDomain: 'penal-code-7d5f4.firebaseapp.com',
    storageBucket: 'penal-code-7d5f4.appspot.com',
    measurementId: 'G-2VG6ZVLWFT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPzAI9QoeweueTdDeSSZOFHyKqLHjDRTI',
    appId: '1:607661121053:android:c16c085e1b7f97b76fb0f4',
    messagingSenderId: '607661121053',
    projectId: 'penal-code-7d5f4',
    storageBucket: 'penal-code-7d5f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPzAI9QoeweueTdDeSSZOFHyKqLHjDRTI',
    appId: '1:607661121053:ios:1a1391e937987b806fb0f4',
    messagingSenderId: '607661121053',
    projectId: 'penal-code-7d5f4',
    storageBucket: 'penal-code-7d5f4.appspot.com',
    iosBundleId: 'com.example.bhenskidum',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPzAI9QoeweueTdDeSSZOFHyKqLHjDRTI',
    appId: '1:607661121053:ios:418391645c6511b86fb0f4',
    messagingSenderId: '607661121053',
    projectId: 'penal-code-7d5f4',
    storageBucket: 'penal-code-7d5f4.appspot.com',
    iosBundleId: 'com.example.bhenskidum.RunnerTests',
  );
}
