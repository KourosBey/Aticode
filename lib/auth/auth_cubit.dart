import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState { login, signUp, confirmSignUp, mainPage, profilePage }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.login);
  void showLoginPage() => emit(AuthState.login);
  void showMainPage() => emit(AuthState.mainPage);
  void showProfilePage() => emit(AuthState.profilePage);
  void showRegisterPage() => emit(AuthState.signUp);
  void showForgetPassword() => (print("gelicek"));
}
