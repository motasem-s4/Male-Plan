import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:meal_plan/blocs/auth_bloc.dart';
import 'package:meal_plan/screens/home.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {

  StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context,listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if(fbUser != null){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home())
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = Provider.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              Buttons.Facebook,
              onPressed: () {
                authBloc.loginFacebook();
              },
            ),
            SignInButton(
              Buttons.GoogleDark,
              onPressed: () {
                authBloc.signInGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
