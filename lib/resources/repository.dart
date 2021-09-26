import 'package:firebase_auth/firebase_auth.dart';

import 'chat_firebase_provider.dart';

class Repository {
  final firebaseProvider = FirebaseProvider();
  UserCredential userCredential;
  User user;

  Future<User> registerUser(String email, String password) async {
    await firebaseProvider.registerWithEmailAndPassword(email, password);

    return user;
  }

  Future<User> logIn(String email, String password) async {
    await firebaseProvider.logIn(email, password);

    return user;
  }

  Future logOut() async {
    await firebaseProvider.logOut();
  }
}
