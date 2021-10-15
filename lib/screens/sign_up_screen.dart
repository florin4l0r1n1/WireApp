import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wire_app/bloc/auth/register/register_bloc.dart';
import 'package:wire_app/helper/form_submission_status.dart';
import '../bloc/auth/register/register_bloc.dart';
import '../bloc/auth/register/register_event.dart';
import '../bloc/auth/register/register_state.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormFieldState>();
  Widget build(BuildContext context) {
    return Scaffold(body: registerForm(context));
  }

//de impolementat validarea bi noua structura BloC
  Widget registerForm(BuildContext context) {
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
              _passwordField1(),
              SizedBox(height: 10),
              _passwordField2(),
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
      width: 200,
      height: 200,
      child: Image.asset('lib/images/logo.png'),
    );
  }

  Widget _emailField() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'email Address',
          hintText: 'name@example.com',
        ),
        validator: (value) => state.isValidEmail ? null : "Email i not valid",
        onChanged: (value) => context
            .read<RegisterBloc>()
            .add(RegisterEmailChanged(email: value)),
      );
    });
  }

  Widget _passwordField1() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'set password',
          labelText: 'set password',
        ),
        validator: (value) =>
            state.isValidPassword ? null : "Password is npt valid",
        onChanged: (value) => context.read<RegisterBloc>().add(
              RegisterPasswordChanged(password: value),
            ),
      );
    });
  }

  Widget _passwordField2() {
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'comfirm password',
          labelText: 'comfirm password',
        ),
        validator: (value) => null);
  }

  Widget _signUpButton(
    BuildContext context,
  ) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return state.formSubmissionStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              child: Icon(Icons.app_registration_rounded),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                padding: EdgeInsets.all(10),
                elevation: 15,
                primary: Theme.of(context).buttonColor,
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context.read<RegisterBloc>().add(RegisterSubmitted());
                }
              },
            );
    });
  }
}
