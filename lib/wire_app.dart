import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/navigation_bar.dart';
import './screens/introduction_screen.dart';
import './screens/log_in_screen.dart';
import './screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bloc/auth/auth_bloc.dart';
import './bloc/auth/auth_repository.dart';

class WireApp extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Future<FirebaseApp> _initailization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.grey[300],
            accentColor: Colors.brown[700],
            buttonColor: Colors.blueGrey[700],
            accentColorBrightness: Brightness.dark),
        home: Scaffold(
          body: FutureBuilder(
              future: _initailization,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('something whent wrong with firebase');
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  return RepositoryProvider(
                      create: (context) => Authrepository(),
                      child: LogInScreen());
                }
                return Scaffold(
                  body: Container(
                    child: Text('err'),
                  ),
                );
              }),
        ),
        routes: <String, WidgetBuilder>{
          '/LogIn': (BuildContext context) => LogInScreen(),
          '/SignUp': (BuildContext context) => SignUpScreen(),
          '/MainScreen': (BuildContext context) => Navigationbar()
        });
  }
}
