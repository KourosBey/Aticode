import 'package:aticode/auth/register/controller/register_bloc.dart';
import 'package:aticode/auth/register/controller/register_event.dart';
import 'package:aticode/auth/register/controller/register_state.dart';
import 'package:aticode/auth/auth_cubit.dart';
import 'package:aticode/auth/auth_repository.dart';
import 'package:aticode/auth/form_submission_status.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterBloc(
          authRepo: context.read<AuthRepository>(),
        ),
        child: _loginForm(context),
      ),
    );
  }

  Widget _loginForm(BuildContext context1) {
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (RegisterUser().formStatus is RegisterSubmissionFailed) {
            return Center(
              child: CircularProgressIndicator(),
            );
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
                  _rePassField(),
                  _loginButton(context1),
                  _registerField(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _passField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
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
              RegisterUser().isValidPassword ? null : 'Password is to short',
          onChanged: (value) => context.read<RegisterBloc>().add(
                RegisterPasswordChanged(value),
              ),
        );
      },
    );
  }

  Widget _rePassField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.vpn_key),
            hintText: 'Re-Password',
            filled: true,
            fillColor: Colors.white,
          ),
          //Textfield control
          validator: (value) =>
              RegisterUser().isValidPassword ? null : 'Password is to short',
          onChanged: (value) => context.read<RegisterBloc>().add(
                RegisterRePasswordChanged(value),
              ),
        );
      },
    );
  }

  Widget _usernameField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
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
              RegisterUser().isValidUsername ? null : 'Username is to short',
          onChanged: (value) => context.read<RegisterBloc>().add(
                RegisterUsernameChanged(value),
              ),
        );
      },
    );
  }

  Widget _loginButton(BuildContext context1) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return RegisterUser().formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context.read<RegisterBloc>().add(RegisterSubmitted());
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
