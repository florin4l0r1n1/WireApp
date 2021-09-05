import 'package:flutter/material.dart';

class UniversalListTile extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Username'),
          leading: Image.asset('lib/images/avatar.png'),
          subtitle: Text('Last message'),
          trailing: Text('Status'),
        ),
        Divider(
          height: 5,
          color: Colors.white,
        )
      ],
    );
  }
}
