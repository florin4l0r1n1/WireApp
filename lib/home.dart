import 'package:flutter/material.dart';
import 'widgets/navigation_bar.dart';
import './screens/introduction_screen.dart';
import './screens/log_in_screen.dart';
import './screens/sign_up_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // bool isNewUser = false;

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
          // if user == null introduction screen and signUp
          // else LogInscreen or GhatScreen
          body: IntroductionScreen()
          // SignUpScreen()
          //  Navigationbar()
          // LogInScreen(),
          ,
        ),
        // isNewUser ? Navigationbar() : IntroductionScreen()

        routes: <String, WidgetBuilder>{
          '/LogIn': (BuildContext context) => LogInScreen(),
          '/SignUp': (BuildContext context) => SignUpScreen(),
          '/MainScreen': (BuildContext context) => Navigationbar()
        });
  }
}
