import 'package:aticode/API/models/teacherModel.dart';

abstract class MainEvent {}

class MainInit extends MainEvent {}

class MainEventTeacherTap extends MainEvent {
  final String username;
  MainEventTeacherTap(this.username);
}

class MainEventScheduleTap extends MainEvent {
  final DateTime date;
  MainEventScheduleTap(this.date);
}

class MainEventActivitiesTap extends MainEvent {}

class MainEventPageRouteTap extends MainEvent {}

class MainEventMessageTap extends MainEvent {}

class MainTeacherGetEvent extends MainEvent {
  final Teacher teachers;
  MainTeacherGetEvent({this.teachers});
}