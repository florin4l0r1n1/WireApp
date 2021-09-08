import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [_emailField(), _passwordField(), _signUpButton()],
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'email Address', hintText: 'name@example.com'),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(hintText: 'password', labelText: 'password'),
    );
  }

  Widget _signUpButton() {
    return ElevatedButton(onPressed: () {}, child: Icon(Icons.login_outlined));
  }
}
