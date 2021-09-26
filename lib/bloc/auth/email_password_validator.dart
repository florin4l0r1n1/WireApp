import 'dart:async';

class Validators {
  String pass1;
  String pass2;
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.toString().contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  validatePassword1() {
    final validatePassword1 = StreamTransformer<String, String>.fromHandlers(
        handleData: (password1, sink) {
      pass1 = password1;
      if (password1.length > 3) {
        sink.add(password1);
      } else {
        sink.addError('Password must be least 3 characters');
      }
    });
    return validatePassword1;
  }

  validatePassword2() {
    final validatePassword2 = StreamTransformer<String, String>.fromHandlers(
        handleData: (password2, sink) {
      pass2 = password2;
      if (password2 == pass1) {
        sink.add(password2);
      } else {
        sink.addError("Password's don't match");
      }
    });
    return validatePassword2;
  }
}
