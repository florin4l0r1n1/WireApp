import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'email Address',
          hintText: 'name@example.com'),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'password',
          labelText: 'password'),
    );
  }

  Widget _signUpButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        padding: EdgeInsets.all(10),
        elevation: 15,
        primary: Theme.of(context).buttonColor,
      ),
      onPressed: () {},
      child: Text('LogIn'),
    );
  }
}
