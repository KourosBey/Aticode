import 'package:aticode/auth/form_submission_status.dart';

abstract class RegisterState {}

class RegisterSubmissionFailed extends RegisterState {
  final String e;
  RegisterSubmissionFailed(this.e);
}

class RegisterInitState extends RegisterState {}

class RegisterSubmitting extends RegisterState {}

class RegisterUsernameFailed extends RegisterState {
  final String e;
  RegisterUsernameFailed(this.e);
}

class RegisterPasswordFailed extends RegisterState {
  final String e;
  RegisterPasswordFailed(this.e);
}

class RegisterRePasswordFailed extends RegisterState {
  final String e;
  RegisterRePasswordFailed(this.e);
}

class RegisterSubmitSuccesful extends RegisterState {}

class RegisterUser {
  final String username;
  bool get isValidUsername => username.length < 3;
  final String password;
  bool get isValidPassword => password.length < 6;
  final String rePassword;
  bool get isValidRePassword => password == rePassword;

  final String email;

  final FormSubmissionStatus formStatus;

  RegisterUser({
    this.username = '',
    this.password = '',
    this.rePassword = '',
    this.email = '',
    this.formStatus = const InitialFormStatus(),
  });
  RegisterUser copyWith({
    String? username,
    String? password,
    String? rePassword,
    String? email,
    FormSubmissionStatus? formStatus,
  }) {
    return RegisterUser(
      username: username ?? this.username,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      email: email ?? this.email,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
