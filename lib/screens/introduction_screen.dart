import 'package:flutter/cupertino.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroductionScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return _introductionScreens();
  }

  Widget _introductionScreens() {
    final screens = [
      PageViewModel(
          pageColor: const Color(0xFF03A9F4), body: Text(' pagina 1 slider')),
      PageViewModel(
          pageColor: const Color(0xFF8BC34A), body: Text(' pagina 2 slider')),
      PageViewModel(
          pageColor: const Color(0x9F93A1F4), body: Text(' pagina 3 slider')),
    ];
  }
}
