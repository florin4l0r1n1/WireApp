import 'package:wire_app/bloc/auth/register/register_event.dart';
import 'package:wire_app/bloc/auth/register/register_state.dart';
import 'package:wire_app/helper/form_submission_status.dart';
import 'register_repository.dart';
import 'package:bloc/bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository registeRepository;

  RegisterBloc({this.registeRepository}) : super(RegisterState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterEmailChanged) {
      yield state.coppyWith(email: event.email);
    } else if (event is RegisterPasswordChanged) {
      yield state.coppyWith(password: event.password);
    } else if (event is RegisterSubmitted) {
      yield state.coppyWith(formSubmissionStatus: FormSubmitting());

      try {
        await registeRepository.register();
        yield state.coppyWith(formSubmissionStatus: SubmissionSucces());
      } catch (e) {
        yield state.coppyWith(formSubmissionStatus: SubmissionFailed());
      }
    }
  }
}
