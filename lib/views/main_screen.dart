import 'package:aticode/API/models/teacherModel.dart';
import 'package:aticode/auth/auth_cubit.dart';

import 'package:aticode/bloc/main/main_bloc.dart';
import 'package:aticode/bloc/main/main_event.dart';
import 'package:aticode/bloc/main/main_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// STORY İLE MAİN BLOC BİRLEŞTİRİLECEK
class MainPage extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainPage> {
  int _selectedIndex = 0;
  final MainBloc _blocs = MainBloc();
  @override
  void initState() {
    _blocs.add(GetTeacherList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: _bottomNavBarBloc(),
        body: SingleChildScrollView(
          child: _buildListTeacher(),
        ),
      ),
    );
  }

  Widget _buildListTeacher() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _blocs,
        child: BlocListener<MainBloc, MainState>(
          listener: (context, state) {
            if (state is ErrorStory) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state is InitialStateMainState) {
                return _buildLoading();
              } else if (state is LoadingStory) {
                return _buildLoading();
              } else if (state is LoadedStory) {
                return Column(children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    height: 120,
                    child: _buildTeacherStory(context, state.tModel),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                      ),
                    ),
                    height: 115,
                    child: _buildCourses(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    child: _buildNewsFeed(),
                  )
                ]);
              } else if (state is ErrorStory) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildCourses() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, state) {
          return Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
              color: Colors.lightBlue,
            ),
            margin: EdgeInsets.all(5.0),
            child:
                Container(margin: EdgeInsets.all(10.0), child: Text("Kurslar")),
          );
        });
  }

  Widget _buildNewsFeed() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
        ),
      ),
      child: Card(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 40, top: 40),
        color: Colors.lightBlue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(80),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(margin: EdgeInsets.all(10), child: Text('Quiz')),
            _buildQuestion(),
            _answerButton(context),
            _answerButton(context),
            _answerButton(context),
            _answerButton(context)
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherStory(BuildContext context, List<Teacher> tModel) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: tModel.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 35,
                  backgroundColor: Colors.grey,
                ),
                Text("${tModel[index].kAdi!}"),
              ],
            ),
          ),
        );
      },
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
    if (index == 1) context.read<AuthCubit>().showProfilePage();
  }
}

Widget _buildQuestion() {
  return Container(
    margin: EdgeInsets.all(20),
    child: Center(child: Text("SORU SORU SORU SORU")),
  );
}

Widget _answerButton(context) {
  return Container(
      child: Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius?.circular(10),
          color: Colors.white,
        ),
        margin: EdgeInsets.all(10),
        height: 50,
        width: MediaQuery.of(context).size.width,
      )
    ],
  ));
}
