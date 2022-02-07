import 'package:aticode/auth/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class RouterPage extends StatefulWidget {
  @override
  _RouterPage createState() => _RouterPage();
}

class _RouterPage extends State<RouterPage> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBarBloc(),
      body: Container(),
    );
  }

  Widget _bottomNavBarBloc() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: _selectedIndex,
      onTap: _onTapped,
    );
  }

  void _onTapped(int index) {
    if (index == 0) context.read<AuthCubit>().showMainPage();
  }
}
