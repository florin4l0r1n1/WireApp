import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebaseSource = 'https://wireapp-ed879-default-rtdb.firebaseio.com/';

class FirebaseProvider {
  var client = http.Client();

  Future<List<int>> fetchUid() async {
    final response = await client.get(
      Uri.parse(_firebaseSource),
    );

    final id = json.decode(response.body);
    return id;
  }

  fetchUserData() {
    // final response = client.get(url)
  }

  Future<void> addUser(UserModel user) async {
    final postUrl = '$_firebaseSource/Users/{$user.id}.json';

    final postRequest = await http.post(Uri.parse(postUrl),
        body: json.encode({
          'userId': user.uid,
          'message': user.message,
          'image': user.image,
          'status': user.isOnline
        }));
  }

  addUserData() {}
}
