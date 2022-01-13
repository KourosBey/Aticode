import 'package:aticode/API/respositories/teacherResp.dart';
import 'package:aticode/bloc/main/main_event.dart';
import 'package:aticode/bloc/main/main_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(InitialStateMainState()) {
    final TeacherRepository _repository = TeacherRepository();
    on<MainEventTeacherTap>(handleActivitiesTap);
    on<GetTeacherList>((event, emit) async {
      try {
        emit(LoadingStory());
        final tList = await _repository.fetchTeacherList();
        emit(LoadedStory(tList));
      } on NetworkError {
        emit(ErrorStory("Failed to fetch data, is your device online?"));
      }
    });
  }

  void handleActivitiesTap(
      MainEventTeacherTap event, Emitter<MainState> emit) {}
}
