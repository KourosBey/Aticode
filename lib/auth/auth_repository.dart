import 'package:aticode/API/models/userLoginModel.dart';
import 'package:aticode/API/respositories/teacherResp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthRepository {
  Future<void> login(username, password) async {
    final TeacherRepository _repository = TeacherRepository();
    CurrentUser? user;
    user!.email = username;
    user.password = password;
    final token = await _repository.sendLoginUser(user);
  }

  Future<void> register() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
