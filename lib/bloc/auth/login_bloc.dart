import 'package:bloc/bloc.dart';
import 'package:wire_app/bloc/auth/form_submission_status.dart';
import 'package:wire_app/bloc/auth/login_event.dart';
import 'package:wire_app/bloc/auth/login_state.dart';
import 'auth_repository.dart';

class LoginBloc extends Bloc<LogInEvent, LoginState> {
  final Authrepository authRepository;

  LoginBloc({this.authRepository}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LogInEvent event) async* {
    if (event is LogInEmailChanged) {
      yield state.coppyWith(email: event.email);
    } else if (event is LoginPasswordChanged) {
      yield state.coppyWith(password: event.password);
    } else if (event is LogInSubmitted) {
      yield state.coppyWith(formSubmissionStatus: FormSubmitting());

      try {
        await authRepository.login();
        yield state.coppyWith(formSubmissionStatus: SubmissionSucces());
      } catch (e) {
        yield state.coppyWith(formSubmissionStatus: SubmissionFailed());
      }
    }
  }
}
