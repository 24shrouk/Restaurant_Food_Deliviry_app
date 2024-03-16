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
    apiKey: 'AIzaSyBn9a3jaPu2AhTD6BnPXDB4WJ6Tjw1uN6w',
    appId: '1:439556290213:web:b420e45eb4ee870bb03f4c',
    messagingSenderId: '439556290213',
    projectId: 'restaurant-app-6fed0',
    authDomain: 'restaurant-app-6fed0.firebaseapp.com',
    storageBucket: 'restaurant-app-6fed0.appspot.com',
    measurementId: 'G-25X9R54DCV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDou8JYyjCnJsxor3o4H8jAHutbDD0kBgQ',
    appId: '1:439556290213:android:0254e803f8f449f0b03f4c',
    messagingSenderId: '439556290213',
    projectId: 'restaurant-app-6fed0',
    storageBucket: 'restaurant-app-6fed0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDys9vFqAKrVPwpd6WuKGyaMGbs9BMDoK8',
    appId: '1:439556290213:ios:aee8ecf0f4751357b03f4c',
    messagingSenderId: '439556290213',
    projectId: 'restaurant-app-6fed0',
    storageBucket: 'restaurant-app-6fed0.appspot.com',
    iosBundleId: 'com.example.restaurantApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDys9vFqAKrVPwpd6WuKGyaMGbs9BMDoK8',
    appId: '1:439556290213:ios:57be6378ccccb9e0b03f4c',
    messagingSenderId: '439556290213',
    projectId: 'restaurant-app-6fed0',
    storageBucket: 'restaurant-app-6fed0.appspot.com',
    iosBundleId: 'com.example.restaurantApp.RunnerTests',
  );
}
