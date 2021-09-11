import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import 'chat_screen.dart';

class IntroductionScreen extends StatelessWidget {
  final pages = [
    PageViewModel(
        pageColor: Colors.black,
        title: Text(
          'Page1',
          style: TextStyle(color: Colors.white),
        )),
    PageViewModel(
        pageColor: Colors.black,
        title: Text(
          'Page2',
          style: TextStyle(color: Colors.white),
        )),
    PageViewModel(
        pageColor: Colors.black,
        title: Text(
          'Page3',
          style: TextStyle(color: Colors.white),
        )),
  ];
  Widget build(BuildContext context) {
    return Builder(builder: (context) => _introScreen());
  }

  Widget _introScreen() {
    return IntroViewsFlutter(
      pages,
      showBackButton: true,
      showNextButton: true,
      showSkipButton: true,
    );
  }
}
