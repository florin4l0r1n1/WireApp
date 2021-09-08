import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../bloc/user_bloc.dart';
export '../bloc/user_bloc.dart';

class UserProvider extends InheritedWidget {
 final UserBloc userBloc;
  UserProvider({Key? key, Widget child})
      : userBloc = UserBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static UserBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<UserProvider>())!
        .userBloc;
  }
}
