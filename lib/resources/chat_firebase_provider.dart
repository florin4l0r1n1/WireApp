// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseProvider {
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (err.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {}

    return userCredential;
  }
}
