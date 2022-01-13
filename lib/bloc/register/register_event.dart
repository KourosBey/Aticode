import 'package:aticode/auth/form_submission_status.dart';

abstract class RegisterEvent {}

class RegisterUsernameChanged extends RegisterEvent {
  final String username;

  RegisterUsernameChanged(this.username);
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;
  RegisterPasswordChanged(this.password);
}

class RegisterRePasswordChanged extends RegisterEvent {
  final String rePassword;
  RegisterRePasswordChanged(this.rePassword);
}

class RegisterFormStatusChanged extends RegisterEvent {
  FormSubmissionStatus formStatus;
  RegisterFormStatusChanged(this.formStatus);
}

class RegisterSubmitted extends RegisterEvent {}
