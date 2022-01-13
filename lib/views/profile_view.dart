import 'package:aticode/bloc/profile/profile_bloc.dart';
import 'package:aticode/bloc/profile/profile_event.dart';
import 'package:aticode/bloc/profile/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileBloc(isCurrentUser: true, user: null),
        child: Scaffold(
          appBar: AppBar(),
          body: _profilePage(),
        ));
  }

  Widget _appBar() {
    final appBarHeight = AppBar().preferredSize.height;

    return PreferredSize(
        child:
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          return AppBar(
            title: Text('Profile'),
            actions: [
              if (state.isCurrentUser!)
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.logout),
                ),
            ],
          );
        }),
        preferredSize: Size.fromHeight(appBarHeight));
  }

  Widget _profilePage() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              _avatar(),
              if (state.isCurrentUser!) _changeAvatarButton(),
              SizedBox(height: 30),
              _usernameTile(),
              _emailTile(),
              _descriptionTile(),
              if (state.isCurrentUser!) _saveProfileChangesButton(),
            ],
          ),
        ),
      );
    });
  }

  _avatar() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return CircleAvatar(
        radius: 50,
        child: Icon(Icons.person),
      );
    });
  }

  _changeAvatarButton() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return TextButton(
        onPressed: () {},
        child: Text('Change Avatar'),
      );
    });
  }

  _usernameTile() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.person),
        title: Text(state.username!),
      );
    });
  }

  _emailTile() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.mail),
        title: Text(state.email!),
      );
    });
  }

  _descriptionTile() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.edit),
        title: TextFormField(
          initialValue: state.userDescription,
          decoration: InputDecoration.collapsed(
              hintText: state.isCurrentUser!
                  ? 'Say something about yourself'
                  : 'This user hasn\'t updated their profile'),
          maxLines: null,
          readOnly: !state.isCurrentUser!,
          toolbarOptions: ToolbarOptions(
            copy: state.isCurrentUser!,
            cut: state.isCurrentUser!,
            paste: state.isCurrentUser!,
            selectAll: state.isCurrentUser!,
          ),
          onChanged: (value) => context
              .read<ProfileBloc>()
              .add(ProfileDescriptionChanged(description: value)),
        ),
      );
    });
  }

  _saveProfileChangesButton() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () {},
        child: Text('Save Changes'),
      );
    });
  }
}
