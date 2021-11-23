import 'package:aticode/auth/auth_cubit.dart';

import 'package:aticode/auth/login/view/login_view.dart';
import 'package:aticode/main/view/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state == AuthState.login) MaterialPage(child: LoginView()),
          if (state == AuthState.signUp ||
              state == AuthState.confirmSignUp) ...[
            MaterialPage(
              child: Container(),
            ),
            if (state == AuthState.confirmSignUp)
              MaterialPage(
                child: Container(),
              )
          ],
          if (state == AuthState.mainPage) MaterialPage(child: MainScreen())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
