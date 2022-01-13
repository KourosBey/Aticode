import 'package:aticode/API/models/userModel.dart';
import 'package:flutter/foundation.dart';

abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {
  final UserModel? user;
  late UserModel selectedUser;

  Authenticated({@required this.user});
}
