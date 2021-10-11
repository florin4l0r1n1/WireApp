abstract class RegisterEvent {}

class RegisterEmailChanged extends RegisterEvent {
  final String email;
  RegisterEmailChanged({this.email});
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  RegisterPasswordChanged({this.password});
}

class RegisterSubmittter extends RegisterEvent {}
