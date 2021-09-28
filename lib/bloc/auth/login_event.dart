abstract class LogInEvent {}

class LogInEmailChanged extends LogInEvent {
  final String email;
  LogInEmailChanged({this.email});
}

class LoginPasswordChanged extends LogInEvent {
  final String password;

  LoginPasswordChanged({this.password});
}

class LogInSubmitted extends LogInEvent {}
