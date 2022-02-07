import 'package:aticode/navigation/navigation_cubit.dart';
import 'package:aticode/views/main_screen.dart';
import 'package:aticode/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainNavigatorCubit, MainStateNavigator>(
        builder: (context, state) {
      return Navigator(
        pages: [
          if (state == MainStateNavigator.mainPage)
            MaterialPage(child: MainPage())
          else if (state == MainStateNavigator.profile)
            MaterialPage(child: ProfileView())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
