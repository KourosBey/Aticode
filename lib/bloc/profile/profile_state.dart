import 'package:aticode/API/models/teacherModel.dart';
import 'package:aticode/auth/form_submission_status.dart';
import 'package:flutter/cupertino.dart';

// User Modeli yapılacak
class ProfileState {
  final Teacher? user;
  final bool? isCurrentUser;
  final String? avatarPath;
  final String? userDescription;
  String? get username => user?.kAdi;
  String? get email => user?.kEmail;
  final FormSubmissionStatus formStatus;
  ProfileState({
    Teacher? user,
    @required bool? isCurrentUser,
    String? avatarPath,
    String? userDescription,
    this.formStatus = const InitialFormStatus(),
  })  : this.user = user,
        this.isCurrentUser = false,
        this.avatarPath = avatarPath,
        this.userDescription = userDescription;
  ProfileState copyWith({
    Teacher? user,
    String? avatarPath,
    String? description,
    FormSubmissionStatus? formStatus,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isCurrentUser: true,
      avatarPath: avatarPath ?? this.avatarPath,
      userDescription: userDescription ?? this.userDescription,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
