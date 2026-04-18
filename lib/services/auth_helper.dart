import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        // On Web, Firebase can natively handle the OAuth popup
        GoogleAuthProvider authProvider = GoogleAuthProvider();
        return await FirebaseAuth.instance.signInWithPopup(authProvider);
      } else {
        // On Mobile, we trigger the native Google Account Picker
        final GoogleSignIn googleSignIn = GoogleSignIn();
        
        final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
        
        // If the user didn't cancel the sign-in
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;
              
          // Create a new credential from the retrieved tokens
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );
          
          // Sign in to Firebase with that credential
          return await FirebaseAuth.instance.signInWithCredential(credential);
        }
      }
    } catch (e) {
      debugPrint("Google Sign In Error: $e");
      rethrow;
    }
    return null;
  }
}
