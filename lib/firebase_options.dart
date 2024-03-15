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
    apiKey: 'AIzaSyDvgdwDWw-yNKdXCjDZJ2cFOZs4Oj3YPhM',
    appId: '1:531533842476:web:aaf9b4e84c3c7b2a732989',
    messagingSenderId: '531533842476',
    projectId: 'ttnflix-f7486',
    authDomain: 'ttnflix-f7486.firebaseapp.com',
    storageBucket: 'ttnflix-f7486.appspot.com',
    measurementId: 'G-DLFM5LVF6Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKioaFBK0UYXZFJqfxY0xnZeW_YOZJZug',
    appId: '1:531533842476:android:86b85968d7e62cd2732989',
    messagingSenderId: '531533842476',
    projectId: 'ttnflix-f7486',
    storageBucket: 'ttnflix-f7486.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQLOxJDKd8vl9TJMdysYG3HulAaevAchQ',
    appId: '1:531533842476:ios:a95399752a97597e732989',
    messagingSenderId: '531533842476',
    projectId: 'ttnflix-f7486',
    storageBucket: 'ttnflix-f7486.appspot.com',
    iosBundleId: 'com.example.ottApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQLOxJDKd8vl9TJMdysYG3HulAaevAchQ',
    appId: '1:531533842476:ios:ba34d172d7b3bef3732989',
    messagingSenderId: '531533842476',
    projectId: 'ttnflix-f7486',
    storageBucket: 'ttnflix-f7486.appspot.com',
    iosBundleId: 'com.example.ottApp.RunnerTests',
  );
}
