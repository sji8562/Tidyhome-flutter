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
    apiKey: 'AIzaSyCFfKVV5F1r46CuIEK47LZB1QES3Hsp8vU',
    appId: '1:1001508290866:web:48a3c0fa74e08e8fe0572b',
    messagingSenderId: '1001508290866',
    projectId: 'tidyhome-cac45',
    authDomain: 'tidyhome-cac45.firebaseapp.com',
    storageBucket: 'tidyhome-cac45.appspot.com',
    measurementId: 'G-R85TNN7VKZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLn2RvP3hEjQBHVvyUGmenVgP-sdIZtv8',
    appId: '1:1001508290866:android:4a305e6e51e87b73e0572b',
    messagingSenderId: '1001508290866',
    projectId: 'tidyhome-cac45',
    storageBucket: 'tidyhome-cac45.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFy6yKdA85xT3YPO3YJQl_oopmGr-5pc4',
    appId: '1:1001508290866:ios:f2cd7378d9b3999de0572b',
    messagingSenderId: '1001508290866',
    projectId: 'tidyhome-cac45',
    storageBucket: 'tidyhome-cac45.appspot.com',
    iosBundleId: 'com.tenco.toyproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFy6yKdA85xT3YPO3YJQl_oopmGr-5pc4',
    appId: '1:1001508290866:ios:a60f1ae1f84dcc5de0572b',
    messagingSenderId: '1001508290866',
    projectId: 'tidyhome-cac45',
    storageBucket: 'tidyhome-cac45.appspot.com',
    iosBundleId: 'com.tenco.toyproject.RunnerTests',
  );
}
