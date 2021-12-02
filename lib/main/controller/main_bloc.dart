import 'dart:async';

import 'package:aticode/main/controller/main_event.dart';
import 'package:aticode/main/controller/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aticode/auth/auth_repository.dart';

abstract class MainBloc extends Bloc<MainEvent, MainState> {
  final AuthRepository authRepo;
  MainBloc({this.authRepo}) : super(InitialStateMainState()) {
    on<MainEventTeacherTap>(handleUserData);
    on<MainEventScheduleTap>(handleScheduleData);
    on<MainEventActivitiesTap>(handleActivitiesTap);
  }

  void handleUserData(MainEventTeacherTap event, Emitter<MainState> emit) {
    emit(MainClickTeacherState().copyWith(username: event.username));
  }

  void handleScheduleData(
      MainEventScheduleTap event, Emitter<MainState> emit) {}

  void handleActivitiesTap(
      MainEventActivitiesTap event, Emitter<MainState> emit) {}
}
