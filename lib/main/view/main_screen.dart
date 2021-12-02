import 'dart:js';

import 'package:aticode/auth/auth_repository.dart';
import 'package:aticode/auth/form_submission_status.dart';
import 'package:aticode/auth/login/controller/login_bloc.dart';
import 'package:aticode/main/controller/main_bloc.dart';
import 'package:aticode/main/controller/main_event.dart';
import 'package:aticode/main/controller/main_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (context) => LoginBloc(
            authRepo: context.read<AuthRepository>(),
          ),
          child: mainScreenBuilder(context),
        ));
  }

  Widget mainScreenBuilder(context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.white])),
            child: Column(
              children: [
                appBar(context),
                myActivies(),
                userSchedule(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget appBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.0),
      child: Container(
        width: MediaQuery.of(context).size.height,
        height: 100.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            // Ogretmen Verileri Liste halinde
            activiyFeeds(),
            activiyFeeds(),
            activiyFeeds(),
            activiyFeeds(),
            activiyFeeds(),
            activiyFeeds(),
            activiyFeeds(),
            activiyFeeds(),
            activiyFeeds(),
            activiyFeeds(),
          ],
        ),
      ),
    );
  }

  Widget myActivies() {
    return Card(
      child: Column(
        children: [
          Column(
            children: [
              ListTile(
                title: Text(
                  "Aktivitelerim",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [(Colors.white38), (Colors.transparent)],
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Kullanıcı Aktiviteleri Liste
                    myActiviesFeed(),
                    myActiviesFeed(),
                    myActiviesFeed(),
                    myActiviesFeed(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      elevation: 3,
      shadowColor: Colors.black,
      margin: EdgeInsets.all(10),
    );
  }

  Container myActiviesFeed() {
    return Container(
      color: Colors.transparent,
      width: 100,
      height: double.infinity,
    );
  }

  Widget activiyFeeds() {
    //Veri gönderilecek UsernameOgretmen
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.black38, width: 1),
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  if (state is MainClickTeacherState)
                    context
                        .read<MainBloc>()
                        .add(MainEventTeacherTap(state.username));
                  // Videoya gönderme yapılıcak
                }),
            Text("Atilla"), // VT Ogretmen Adı
          ],
        );
      },
    );
  }

  Widget userSchedule() {
    // Birden fazla ekleme yapılabilir mi?
    return SfCalendar(
      view: CalendarView.week,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.black,
      backgroundColor: Colors.transparent,
    );
  }
}
