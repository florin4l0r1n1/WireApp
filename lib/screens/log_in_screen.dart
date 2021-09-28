import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wire_app/bloc/auth/auth_repository.dart';
import 'package:wire_app/bloc/auth/form_submission_status.dart';
import 'package:wire_app/bloc/auth/login_bloc.dart';
import 'package:wire_app/bloc/auth/login_event.dart';
import 'package:wire_app/bloc/auth/login_state.dart';

class LogInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => LoginBloc(
        authRepository: context.read<Authrepository>(),
      ),
      child: _logInForm(context),
    ));
  }

  Widget _logInForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _logoImage(),
              SizedBox(height: 10),
              _emailField(),
              SizedBox(height: 10),
              _passwordField(),
              SizedBox(height: 10),
              _signUpButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoImage() {
    return Container(
      child: Image.asset('lib/images/logo.png'),
    );
  }

  Widget _emailField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: 'email Address',
            hintText: 'name@example.com'),
        validator: (value) => state.isValidEmail ? null : 'Email is not valid',
        onChanged: (value) =>
            context.read<LoginBloc>().add(LogInEmailChanged(email: value)),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'password',
              labelText: 'password'),
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginPasswordChanged(password: value)),
          validator: (value) =>
              state.isValidPassword ? null : 'password is too short');
    });
  }

  Widget _signUpButton(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formSubmissionStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                padding: EdgeInsets.all(10),
                elevation: 15,
                primary: Theme.of(context).buttonColor,
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context.read<LoginBloc>().add(LogInSubmitted());
                }
              },
              child: Text('LogIn'),
            );
    });
  }
}
