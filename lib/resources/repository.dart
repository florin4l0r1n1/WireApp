import 'chat_firebase_provider.dart';

class Repository {
  final firebaseProvider = FirebaseProvider();

  Future<String> registerUser(String email, String password) {
    firebaseProvider.registerWithEmailAndPassword(email, password);
  }
}
