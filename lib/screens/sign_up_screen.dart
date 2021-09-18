import 'package:flutter/material.dart';
import '../bloc/auth/auth_bloc.dart';

class SignUpScreen extends StatelessWidget {
  String err2;
  Widget build(BuildContext context) {
    final bloc = AuthBloc();
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
              _emailField(bloc),
              SizedBox(height: 10),
              _passwordField1(bloc),
              SizedBox(height: 10),
              _passwordField2(bloc),
              SizedBox(height: 10),
              _signUpButton(context, bloc)
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

  Widget _emailField(AuthBloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: bloc.changeemail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'email Address',
                hintText: 'name@example.com',
                errorText: snapshot.error),
          );
        });
  }

  Widget _passwordField1(AuthBloc bloc) {
    return StreamBuilder(
        stream: bloc.password1,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: bloc.changePassword1,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'set password',
                  labelText: 'set password',
                  errorText: snapshot.error));
        });
  }

  Widget _passwordField2(AuthBloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: bloc.changePassword2,
            obscureText: true,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'comfirm password',
                labelText: 'comfirm password',
                errorText: snapshot.error),
          );
        });
  }

  Widget _signUpButton(BuildContext context, AuthBloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            child: Icon(Icons.app_registration_rounded),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              padding: EdgeInsets.all(10),
              elevation: 15,
              primary: Theme.of(context).buttonColor,
            ),
            onPressed: snapshot.hasData ? bloc.registerUser : null,
          );
        });
  }
}
