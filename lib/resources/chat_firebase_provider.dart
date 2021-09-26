// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseProvider {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String error;
  User user;
  Future<User> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
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

    return user;
  }

  Future<User> logIn(String email, String password) async {
    try {
      UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      user = authResult.user;
    } catch (err) {}

    return user;
  }

  Future logOut() async {
    await firebaseAuth.signOut();
  }
}
