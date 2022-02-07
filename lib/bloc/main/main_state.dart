import 'package:aticode/API/models/teacherModel.dart';
import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class InitialStateMainState extends MainState {}

class LoadingStory extends MainState {}

class LoadedStory extends MainState {
  final List<Teacher> tModel;
  const LoadedStory(this.tModel);
}

class ErrorStory extends MainState {
  final String message;
  const ErrorStory(this.message);
}
/*#####################################################################################*/

class MainClickTeacherState extends MainState {
  final String username;
  bool get isValidUsername => username.length > 3;

  MainClickTeacherState({
    this.username = '',
  });

  MainClickTeacherState copyWith({
    String? username,
  }) {
    return MainClickTeacherState(
      username: username ?? this.username,
    );
  }
}
