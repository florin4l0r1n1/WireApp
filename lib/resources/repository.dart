import 'package:firebase_auth/firebase_auth.dart';

import 'chat_firebase_provider.dart';

class Repository {
  final firebaseProvider = FirebaseProvider();
  UserCredential userCredential;

  Future<String> registerUser(String email, String password) {
    firebaseProvider.registerWithEmailAndPassword(email, password);
  }
}
