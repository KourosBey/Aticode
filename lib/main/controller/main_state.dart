abstract class MainState {}

class InitialStateMainState extends MainState {}

class MainScheduleTapState extends MainState {
  final DateTime date;

  MainScheduleTapState({this.date = null});

  MainScheduleTapState copyWith({
    DateTime date,
  }) {
    return MainScheduleTapState(date: date ?? this.date);
  }
}

class MainClickTeacherState extends MainState {
  final String username;
  bool get isValidUsername => username.length > 3;

  MainClickTeacherState({
    this.username = '',
  });

  MainClickTeacherState copyWith({
    String username,
  }) {
    return MainClickTeacherState(
      username: username ?? this.username,
    );
  }
}
