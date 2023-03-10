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
    apiKey: 'AIzaSyALy2LvuzSj0DOs3ogIcfYowB_YhTm967c',
    appId: '1:774383780799:web:08b4a7dbcff62922f7970a',
    messagingSenderId: '774383780799',
    projectId: 'mynotes-9728d',
    authDomain: 'mynotes-9728d.firebaseapp.com',
    storageBucket: 'mynotes-9728d.appspot.com',
    measurementId: 'G-TSQ618L0F1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCksGuhzP-9YUfmswVjOTFuAXz-UTGSpQ',
    appId: '1:774383780799:android:21562422547e2bb5f7970a',
    messagingSenderId: '774383780799',
    projectId: 'mynotes-9728d',
    storageBucket: 'mynotes-9728d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdeN6qvGjwhT7KKMfz83stq0CThnSMWS0',
    appId: '1:774383780799:ios:5850f3092d4802d2f7970a',
    messagingSenderId: '774383780799',
    projectId: 'mynotes-9728d',
    storageBucket: 'mynotes-9728d.appspot.com',
    iosClientId: '774383780799-makm8ud6jtdigal537dq0d0l3e0tvogb.apps.googleusercontent.com',
    iosBundleId: 'com.makinfstuffup.mynotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdeN6qvGjwhT7KKMfz83stq0CThnSMWS0',
    appId: '1:774383780799:ios:5850f3092d4802d2f7970a',
    messagingSenderId: '774383780799',
    projectId: 'mynotes-9728d',
    storageBucket: 'mynotes-9728d.appspot.com',
    iosClientId: '774383780799-makm8ud6jtdigal537dq0d0l3e0tvogb.apps.googleusercontent.com',
    iosBundleId: 'com.makinfstuffup.mynotes',
  );
}
