import 'dart:async';

import 'package:aticode/bloc/register/register_event.dart';
import 'package:aticode/bloc/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aticode/auth/auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository? authRepo;
  RegisterUser user = RegisterUser(username: '', password: '', rePassword: '');
  RegisterBloc({this.authRepo}) : super(RegisterInitState()) {
    on<RegisterUsernameChanged>(registerUsernameHandle);
    on<RegisterPasswordChanged>(registerPasswordhandle);
    on<RegisterRePasswordChanged>(registerRePasswordhandle);
    on<RegisterFormStatusChanged>(registerFormChanged);
    on<RegisterSubmitted>(registerSubmitted);
  }

  void registerUsernameHandle(
      RegisterUsernameChanged event, Emitter<RegisterState> emit) {
    user = RegisterUser().copyWith(username: event.username);
  }

  void registerPasswordhandle(
      RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    user = RegisterUser().copyWith(password: event.password);
  }

  void registerRePasswordhandle(
      RegisterRePasswordChanged event, Emitter<RegisterState> emit) {
    user = RegisterUser().copyWith(rePassword: event.rePassword);
  }

  FutureOr<void> registerSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(RegisterSubmitting());
    try {
      await authRepo!.register();
      emit(RegisterSubmitSuccesful());
    } catch (e) {}
  }

  void registerFormChanged(event, Emitter<RegisterState> emit) {
    user = RegisterUser().copyWith(formStatus: event.formStatus);
  }
}
