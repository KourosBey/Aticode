import 'package:aticode/API/models/teacherModel.dart';
import 'package:aticode/auth/auth_repository.dart';

import 'package:aticode/main/controller/main/main_bloc.dart';
import 'package:aticode/main/controller/main/main_event.dart';
import 'package:aticode/main/controller/main/main_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// STORY İLE MAİN BLOC BİRLEŞTİRİLECEK
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MainBloc(
                authRepo: context.read<AuthRepository>(),
              ),
            ),
          ],
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
    return BlocConsumer<MainBloc, MainState>(listener: (context, state) {
      if (state is LoadingStory)
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularProgressIndicator(),
          ],
        );
      else if (state is FailureStory)
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('${state.e}'),
            ),
          ],
        );
    }, builder: (context, state) {
      if (state is StoryState) if (state.teachers == null) {
        return Column(
          children: [CircularProgressIndicator()],
        );
      } else {
        List<Teacher> teacherModel = state.teachers;
        return Container(
          color: Colors.red,
          child: ListView.builder(
            itemCount: teacherModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return activiyFeeds(teacherModel[index]);
            },
          ),
        );
      }
      return Container();
    });
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

  Widget activiyFeeds(Teacher teacher) {
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
                    image: new DecorationImage(
                        image: new NetworkImage(teacher.kAvatar)),
                  ),
                ),
                onTap: () {
                  if (state is MainClickTeacherState)
                    context
                        .read<MainBloc>()
                        .add(MainEventTeacherTap(state.username));
                  // Videoya gönderme yapılıcak
                }),
            Text(teacher.kAdi), // VT Ogretmen Adı
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
