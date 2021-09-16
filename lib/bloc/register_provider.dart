import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'register_bloc.dart';

class RegisterUserProvider extends InheritedWidget {
  final bloc = RegisterUserBloc();

  RegisterUserProvider({Key key, Widget child}) : super(key: key, child: child);
  bool updateShouldNotify(_) => true;

  static RegisterUserBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<RegisterUserProvider>())
        .bloc;
  }
}
