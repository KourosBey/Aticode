import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState { login, signUp, confirmSignUp, mainPage }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.login);

  void showMainPage() => emit(AuthState.mainPage);
}
