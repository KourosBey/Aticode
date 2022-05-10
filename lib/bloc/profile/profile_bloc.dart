import 'package:aticode/API/models/postModel.dart';
import 'package:aticode/API/models/teacherModel.dart';
import 'package:aticode/API/respositories/postResp.dart';
import 'package:aticode/bloc/profile/profile_event.dart';
import 'package:aticode/bloc/profile/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({@required bool? isCurrentUser})
      : super(ProfileState(isCurrentUser: isCurrentUser!));

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileEvent) List<PostModel> pList = await loadLocalJson();
    if (event is ChangeAvatarRequest) {
      // show action sheet
    } else if (event is OpenImagePicker) {
      //open image picker
    } else if (event is ProvideImagePath) {
      yield state.copyWith(avatarPath: event.avatarPath!);
    } else if (event is ProfileDescriptionChanged) {
      yield state.copyWith(description: event.description!);
    } else if (event is SaveProfileChanges) {
      // handle datas
    }
  }
}
