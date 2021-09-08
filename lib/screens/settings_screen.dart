import 'package:flutter/widgets.dart';

class Settingsscreen extends StatelessWidget {
  //bloc
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/images/avatar.png'),
          SizedBox(height: 10),
          Text('username'),
          SizedBox(height: 10),
          Text('Status'),
          SizedBox(height: 10),
          Text('Avalable')
        ],
          
      ),
      
    );
  }
}
