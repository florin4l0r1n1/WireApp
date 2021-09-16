import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class RegisterUserBloc {
  final _repository = Repository();

  final _firebaseOutput = BehaviorSubject<String>();

  _registerUser() {}
}
