import 'package:aticode/API/models/teacherModel.dart';

import 'package:aticode/bloc/main/main_bloc.dart';
import 'package:aticode/bloc/main/main_event.dart';
import 'package:aticode/bloc/main/main_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// STORY İLE MAİN BLOC BİRLEŞTİRİLECEK
class MainPage extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainPage> {
  final MainBloc _blocs = MainBloc();
  @override
  void initState() {
    _blocs.add(GetTeacherList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        body: _buildListTeacher(),
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
                    height: 115,
                    child: _buildCard(context, state.tModel),
                  ),
                  Container(
                    height: 200,
                    child: _courses(),
                  ),
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

  Widget _courses() {
    return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, state) {
              return Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey),
                  margin: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Kurslar"),
                    ],
                  ),
                ),
              );
            }));
  }

  Widget _buildCard(BuildContext context, Teacher tModel) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
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
                  Text("${tModel.kAdi!}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
