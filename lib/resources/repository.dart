import 'chat_db_provider.dart';
import 'chat_firebase_provider.dart';
import '../models/user.dart';

class Repository {
  final usr = FirebaseProvider();

  Future<UserModel> addUser(UserModel user) async {
    usr.addUser(user);
  }
}
