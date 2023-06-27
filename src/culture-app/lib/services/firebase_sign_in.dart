import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final GoogleSignIn googleSignIn = GoogleSignIn();

late String name = "Nama";
late String email = "email@example.com";
late String imageUrl = " ";

Future<String?> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken);

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);

  final User? user = authResult.user;

  if (user != null) {
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName!;
    email = user.email!;
    imageUrl = user.photoURL!;

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    assert(!user.isAnonymous);

    final User? currentUser = _auth.currentUser;
    assert(user.uid == currentUser!.uid);

    if (kDebugMode) {
      print('signInWithGoogle succeeded: $user');
    }
    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  if (kDebugMode) {
    print("User Signed Out");
  }
}
