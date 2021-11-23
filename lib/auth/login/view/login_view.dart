import 'package:aticode/auth/auth_cubit.dart';
import 'package:aticode/auth/auth_repository.dart';
import 'package:aticode/auth/form_submission_status.dart';
import 'package:aticode/auth/login/controller/login_bloc.dart';
import 'package:aticode/auth/login/controller/login_event.dart';
import 'package:aticode/auth/login/controller/login_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepo: context.read<AuthRepository>(),
        ),
        child: _loginForm(context),
      ),
    );
  }

  Widget _loginForm(BuildContext context1) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is SubmissionFailed) {
            _showSnackBar(context, formStatus.exception.toString());
          }
        },
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/white-abstract-background_23-2148810113.jpg?size=626&ext=jpg"),
              fit: BoxFit.cover,
            )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _usernameField(),
                  _passField(),
                  _loginButton(context1),
                  _registerField(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _passField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.vpn_key),
            hintText: 'Password',
            filled: true,
            fillColor: Colors.white,
          ),
          //Textfield control
          validator: (value) =>
              state.isValidPassword ? null : 'Password is to short',
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginPasswordChanged(password: value),
              ),
        );
      },
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: false,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Username',
            filled: true,
            fillColor: Colors.white,
          ),
          //Textfield control
          validator: (value) =>
              state.isValidUsername ? null : 'Username is to short',
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginUsernameChanged(username: value),
              ),
        );
      },
    );
  }

  Widget _loginButton(BuildContext context1) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                  context1.read<AuthCubit>().showMainPage();
                }
              },
              child: Text("Login"),
            );
    });
  }

  Widget _registerField() {
    return Padding(
      padding: EdgeInsets.all(40),
      child: RichText(
        text: TextSpan(
            style: TextStyle(color: Colors.black),
            text: 'If u want Register',
            recognizer: TapGestureRecognizer()
              ..onTap = () => print("register   "),
            children: [
              TextSpan(style: TextStyle(color: Colors.black45), text: "  or"),
              TextSpan(
                style: TextStyle(color: Colors.black),
                text: "   Forget password",
                recognizer: TapGestureRecognizer()
                  ..onTap = () => print("password"),
              ),
            ]),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
