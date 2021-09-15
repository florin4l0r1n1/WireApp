import 'package:firebase_auth/firebase_auth.dart';

import 'chat_db_provider.dart';
import 'chat_firebase_provider.dart';
import '../models/user.dart';

class Repository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> addUser(UserModel user) async {}



}
