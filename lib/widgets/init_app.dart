import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wire_app/wire_app.dart';

class InitializeApp extends StatelessWidget {
  // const InitializeApp({ Key key }) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;
  final Future<FirebaseApp> _initailization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initailization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('something whent wrong with firebase');
          }
          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return WireApp();
          }
          return Text('Loading');
        });
  }
}
