import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'email_password_validator.dart';

class AuthBloc with Validators {
  final _email = BehaviorSubject<String>();

  // ignore: close_sinks
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeemail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print('Valid email is $validEmail');
    print('Valid password is $validPassword');
  }

  dispose() {
    _email.close();
    _email.close();
  }
}
