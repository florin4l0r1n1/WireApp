class UserModel {
  int uid;
  bool isOnline;
  String message;
  String image;

  UserModel.fromJson(Map<String, dynamic> parsedJson)
      : uid = parsedJson['uid'],
        isOnline = parsedJson['isOnline'],
        message = parsedJson['message'],
        image = parsedJson['image'];
}
