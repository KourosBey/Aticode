import 'dart:async';

import 'package:aticode/API/respositories/teacherResp.dart';
import 'package:aticode/API/respositories/userPostReq.dart';
import 'package:aticode/bloc/register/register_event.dart';
import 'package:aticode/bloc/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aticode/auth/auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository? authRepo;
  RegisterUser user = RegisterUser(username: '', password: '', rePassword: '');
  UserModelSendReq userSending = UserModelSendReq();
  RegisterBloc({this.authRepo}) : super(RegisterInitState()) {
    on<RegisterUsernameChanged>(registerUsernameHandle);
    on<RegisterPasswordChanged>(registerPasswordhandle);
    on<RegisterRePasswordChanged>(registerRePasswordhandle);
    on<RegisterEmailChanged>(registerEmailhandle);
    on<RegisterFormStatusChanged>(registerFormChanged);
    on<RegisterSubmitted>(registerSubmitted);
  }

  void registerEmailhandle(
      RegisterEmailChanged event, Emitter<RegisterState> emit) {
    user = RegisterUser().copyWith(email: event.email);
    userSending.kEmail = event.email;
  }

  void registerUsernameHandle(
      RegisterUsernameChanged event, Emitter<RegisterState> emit) {
    user = RegisterUser().copyWith(username: event.username);
    userSending.username = event.username;
  }

  void registerPasswordhandle(
      RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    user = RegisterUser().copyWith(password: event.password);
    userSending.kSifre = event.password;
  }

  void registerRePasswordhandle(
      RegisterRePasswordChanged event, Emitter<RegisterState> emit) {
    user = RegisterUser().copyWith(rePassword: event.rePassword);
    userSending.kSifre2 = event.rePassword;
  }

  FutureOr<void> registerSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(RegisterSubmitting());
    try {
      await TeacherRepository().sendNewUser(userSending);
      emit(RegisterSubmitSuccesful());
    } catch (e) {
      throw e;
    }
  }

  void registerFormChanged(event, Emitter<RegisterState> emit) {
    user = RegisterUser().copyWith(formStatus: event.formStatus);
  }
}
