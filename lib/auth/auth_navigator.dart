import 'package:aticode/auth/auth_cubit.dart';
import 'package:aticode/views/bospage.dart';

import 'package:aticode/views/login_view.dart';
import 'package:aticode/views/profile_view.dart';

import 'package:aticode/views/register_view.dart';

import 'package:aticode/views/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state == AuthState.login)
            MaterialPage(
              child: LoginView(),
            ),
          if (state == AuthState.signUp ||
              state == AuthState.confirmSignUp) ...[
            MaterialPage(
              child: RegisterView(),
            ),
          ],
          if (state == AuthState.mainPage)
            MaterialPage(
              child: MainPage(),
            ),
          if (state == AuthState.profilePage)
            MaterialPage(
              child: ProfileView(),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
