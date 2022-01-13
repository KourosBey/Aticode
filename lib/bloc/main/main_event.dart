abstract class MainEvent {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class GetTeacherList extends MainEvent {}

class MainEventTeacherTap extends MainEvent {
  final String username;
  MainEventTeacherTap(this.username);
}
