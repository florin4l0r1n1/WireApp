import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'email_password_validator.dart';

class AuthBloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  dispose() {
    _email.close();
    _email.close();
  }
}
