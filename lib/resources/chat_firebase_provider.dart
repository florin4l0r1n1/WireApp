import 'package:firebase_auth/firebase_auth.dart';

class FirebaseProvider {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String error;
  User user;
  UserCredential userCredential;
  Future<String> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (err.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      error = e.toString();
    }

    return error;
  }

  Future<UserCredential> logIn(String email, String password) async {
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } catch (err) {}

    return userCredential;
  }

  Future logOut() async {
    await firebaseAuth.signOut();
  }

  Future<String> currentUser() async {
    user = firebaseAuth.currentUser;

    return user.uid;
  }

  Future<bool> isSignedIn() async {
    final currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }
}
