import 'dart:isolate';

class User {
  int? uid;
  String? image;
  String? message;
  bool? isOnline;

  User({this.uid, this.isOnline, this.image, this.message});
}
