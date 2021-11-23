abstract class LoginEvent {}

//Frontend --> Backend
class LoginUsernameChanged extends LoginEvent {
  final String username;
  LoginUsernameChanged({this.username});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged({this.password});
}

class LoginSubmitted extends LoginEvent {}
