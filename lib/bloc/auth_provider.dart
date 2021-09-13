import 'package:flutter/material.dart';
import 'auth_bloc.dart';

class AuthProvider extends InheritedWidget {
  final bloc = AuthBloc();
}
