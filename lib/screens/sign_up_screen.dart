import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'email Address',
          hintText: 'name@example.com'),
    );
  }

  Widget _passwordField1() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'set password',
          labelText: 'set password'),
    );
  }

  Widget _passwordField2() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: 'comfirm password',
          labelText: 'comfirm password'),
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
      child: Text('SignUp'),
    );
  }
}
