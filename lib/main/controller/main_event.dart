abstract class MainEvent {}

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
