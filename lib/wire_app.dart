import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wire_app/bloc/auth/auth_provider.dart';
import 'widgets/navigation_bar.dart';
import './screens/introduction_screen.dart';
import './screens/log_in_screen.dart';
import './screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bloc/auth/auth_bloc.dart';

class WireApp extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Future<FirebaseApp> _initailization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _authBloc = AuthProvider.of(context);

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
                // Once complete, show your application
                if (snapshot.connectionState == ConnectionState.done) {
                  return AuthProvider(
                    child: _authBloc.isSignedIn()
                        ? Navigationbar()
                        : LogInScreen(),
                  );

                  // Navigationbar();
                  // IntroductionScreen();
                  SignUpScreen();

                  // LogInScreen();
                }
                return Scaffold(
                  body: Container(
                    child: Text('err'),
                  ),
                );
              }),
        ),
        // isNewUser ? Navigationbar() : IntroductionScreen()

        routes: <String, WidgetBuilder>{
          '/LogIn': (BuildContext context) => LogInScreen(),
          '/SignUp': (BuildContext context) => SignUpScreen(),
          '/MainScreen': (BuildContext context) => Navigationbar()
        });
  }
}
