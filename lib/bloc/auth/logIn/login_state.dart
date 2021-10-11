import 'package:wire_app/helper/form_submission_status.dart';

class LoginState {
  final String email;
  bool get isValidEmail => email.contains('@');

  final String password;

  bool get isValidPassword => password.length > 4;

  final FormSubmissionStatus formSubmissionStatus;

  LoginState(
      {this.email = '',
      this.password = '',
      this.formSubmissionStatus = const InitialFormStatus()});

  LoginState coppyWith(
      {String email,
      String password,
      FormSubmissionStatus formSubmissionStatus}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        formSubmissionStatus:
            formSubmissionStatus ?? this.formSubmissionStatus);
  }
}
