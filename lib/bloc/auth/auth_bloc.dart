import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'email_password_validator.dart';
import '../../resources/repository.dart';

class AuthBloc with Validators {
  final _reppsitory = Repository();
  final _email = BehaviorSubject<String>();
  // ignore: close_sinks
  final _password1 = BehaviorSubject<String>();
  // ignore: close_sinks
  final _password2 = BehaviorSubject<String>();
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password1 =>
      _password1.stream.transform(validatePassword1());
  Stream<String> get password2 =>
      _password2.stream.transform(validatePassword2());

  Stream<bool> get submitValid =>
      Rx.combineLatest3(email, password1, password2, (a, b, c) => true);

  Function(String) get changeemail => _email.sink.add;
  Function(String) get changePassword1 => _password1.sink.add;
  Function(String) get changePassword2 => _password2.sink.add;

  registerUser() {
    final validEmail = _email.value;
    final validPassword1 = _password1.value;
    final validPassword2 = _password2.value;
    _reppsitory.registerUser(validEmail, validPassword2);

    print('Valid email is $validEmail');
    print('Valid password is $validPassword1');
    print('Valid password is $validPassword2');
  }

  logIn() {
    final validEmail = _email.value;
    final validPassword1 = _password1.value;
    _reppsitory.logIn(validEmail, validPassword1);
  }

  logOut() {
    _reppsitory.logOut();
  }

  userID() {
    _reppsitory.currentUser();
  }

  isSignedIn() {
    _reppsitory.isSignedIn();
  }

  dispose() {
    _email.close();
    _email.close();
  }
}
