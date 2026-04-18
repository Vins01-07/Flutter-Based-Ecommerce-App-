import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the flutterfire cli.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the flutterfire cli.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the flutterfire cli.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the flutterfire cli.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZb3RnfNBxdiCraAchG1yVogmrNsW28pE',
    appId: '1:404722517873:android:627c1e4087b0bd11d558d0',
    messagingSenderId: '404722517873',
    projectId: 'fluuter-project-f51a8',
    storageBucket: 'fluuter-project-f51a8.firebasestorage.app',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAZb3RnfNBxdiCraAchG1yVogmrNsW28pE',
    appId: '1:404722517873:web:627c1e4087b0bd11d558d0', // Fallback, best to get true Web App ID from Firebase Console
    messagingSenderId: '404722517873',
    projectId: 'fluuter-project-f51a8',
    storageBucket: 'fluuter-project-f51a8.firebasestorage.app',
    authDomain: 'fluuter-project-f51a8.firebaseapp.com', // Needed for web auth
  );
}
