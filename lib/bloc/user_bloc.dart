import 'package:rxdart/subjects.dart';

import '../models/user.dart';

class UserBloc {
  final _userFetcher = PublishSubject<UserModel>();

  final _userOutput = BehaviorSubject<Map<int, Future<UserModel>>>();

  Function(UserModel) get addUser => _userFetcher.sink.add;
}
