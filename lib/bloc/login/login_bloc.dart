import 'dart:async';

import 'package:aticode/auth/auth_repository.dart';
import 'package:aticode/auth/form_submission_status.dart';
import 'package:aticode/bloc/login/login_event.dart';
import 'package:aticode/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// State ve event ayarlaması
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository? authRepo;

  LoginBloc({this.authRepo}) : super(LoginState()) {
    on<LoginUsernameChanged>(handleUserNameChange);
    on<LoginPasswordChanged>(handlePassChange);
    on<LoginSubmitted>(loginSubmitted);
  }

/*  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
//Username update

    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    }
    //Pass update
    else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSucces());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
*/
  void handleUserNameChange(
      LoginUsernameChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void handlePassChange(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> loginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      await authRepo!.login();
      emit(state.copyWith(formStatus: SubmissionSucces()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }
}
