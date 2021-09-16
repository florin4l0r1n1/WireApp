// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
// final _firebaseSource = 'https://wireapp-ed879-default-rtdb.firebaseio.com/';

class FirebaseProvider {
  // var client = http.Client();

  // Future<List<int>> fetchUid() async {
  //   final response = await client.get(
  //     Uri.parse(_firebaseSource),
  //   );

  //   final id = json.decode(response.body);
  //   return id;
  // }

  // Future<void> addUser(UserModel user) async {
  //   final postUrl = '$_firebaseSource/Users/{$user.id}.json';

  //   final postRequest = await http.post(Uri.parse(postUrl),
  //       body: json.encode({
  //         'userId': user.uid,
  //         'message': user.message,
  //         'image': user.image,
  //         'status': user.isOnline
  //       }));
  // }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (err.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {}
  }
}
