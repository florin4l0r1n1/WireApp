import 'package:flutter/material.dart';
import 'widgets/navigation_bar.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        home: Navigationbar());
  }
}
