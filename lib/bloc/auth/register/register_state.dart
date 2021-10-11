import 'package:wire_app/helper/form_submission_status.dart';

class RegisterState {
  final String email;

  bool get isValidEmail => email.contains('@');
  final String password;

  bool get isValidPassword => password.length > 4;

  final FormSubmissionStatus formSubmissionStatus;

  RegisterState(
      {this.email = '',
      this.password = '',
      this.formSubmissionStatus = const InitialFormStatus()});

  RegisterState coppyWith(
      {String email,
      String password,
      FormSubmissionStatus formSubmissionStatus}) {
    return RegisterState(
        email: email ?? this.email,
        password: password ?? this.password,
        formSubmissionStatus:
            formSubmissionStatus ?? this.formSubmissionStatus);
  }
}
