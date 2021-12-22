import 'package:aticode/API/apiService.dart';
import 'package:aticode/API/respositories/teacherResp.dart';
import 'package:aticode/main/controller/main/main_event.dart';
import 'package:aticode/main/controller/main/main_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aticode/auth/auth_repository.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final AuthRepository authRepo;
  MainBloc({this.authRepo}) : super(InitialStateMainState()) {
    on<MainEventTeacherTap>(handleUserData);
    on<MainEventScheduleTap>(handleScheduleData);
    on<MainEventActivitiesTap>(handleActivitiesTap);
    on<MainTeacherGetEvent>(handleTeachersList);
  }

  void handleUserData(MainEventTeacherTap event, Emitter<MainState> emit) {
    emit(MainClickTeacherState().copyWith(username: event.username));
  }

  void handleScheduleData(
      MainEventScheduleTap event, Emitter<MainState> emit) {}

  void handleActivitiesTap(
      MainEventActivitiesTap event, Emitter<MainState> emit) {}
}

Stream<StoryState> handleTeachersList(
    MainTeacherGetEvent event, Emitter<MainState> emit) async* {
  if (event is MainTeacherGetEvent) {
    try {
      yield LoadingStory();
      await Future.delayed(const Duration(seconds: 2));
      final data =
          await APIWeb().load(TeacherRepository.load("/kullanicilar/"));
      yield StoryState(teachers: data);
    } catch (e) {
      yield FailureStory(e: e);
    }
  }
}
