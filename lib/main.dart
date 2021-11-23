import 'package:aticode/auth/auth_cubit.dart';
import 'package:aticode/auth/auth_navigator.dart';
import 'package:aticode/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) => AuthCubit(),
          child: AuthNavigator(),
        ),
      ),
    );
  }
}
