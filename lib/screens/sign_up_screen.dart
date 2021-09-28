import 'package:flutter/material.dart';
import '../bloc/auth/auth_bloc.dart';

class SignUpScreen extends StatelessWidget {
  String err2;
  Widget build(BuildContext context) {
    final bloc = AuthBloc();
    return Scaffold(
      body: Form(
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
                _signUpButton(context, bloc)
              ],
            ),
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
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: 'email Address',
        hintText: 'name@example.com',
      ),
      validator: (value) => null,
    );
  }

  Widget _passwordField1() {
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'set password',
          labelText: 'set password',
        ),
        validator: (value) => null);
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

  Widget _signUpButton(BuildContext context, AuthBloc bloc) {
    return ElevatedButton(
      child: Icon(Icons.app_registration_rounded),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        padding: EdgeInsets.all(10),
        elevation: 15,
        primary: Theme.of(context).buttonColor,
      ),
      onPressed: () {},
    );
  }
}
