import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:meal_plan/blocs/auth_bloc.dart';
import 'package:meal_plan/screens/login.dart';
import 'package:meal_plan/screens/meal_plan.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StreamSubscription<User> homeStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    homeStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    homeStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: Center(
        child: StreamBuilder<User>(
            stream: authBloc.currentUser,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data.displayName,
                    style: TextStyle(fontSize: 35),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        snapshot.data.photoURL + '?width=500&height500'),
                    radius: 60.0,
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>MealPlan()
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        height: 30.0,
                        width: 200,
                        child: Center(
                          child: Text(
                            'Meal Plan',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      )),
                  FlatButton(
                      onPressed: () {
                        authBloc.logoutOf();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        height: 30.0,
                        width: 200,
                        child: Center(
                          child: Text(
                            'Sign out',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ))
                ],
              );
            }),
      ),
    );
  }
}
