import 'chat_firebase_provider.dart';

class Repository {
  final firebaseProvider = FirebaseProvider();

  Future registerUser(String email, String password) {
    firebaseProvider.registerWithEmailAndPassword(email, password);
  }
}
