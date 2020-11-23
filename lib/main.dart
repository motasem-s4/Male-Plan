import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_plan/blocs/auth_bloc.dart';
import 'package:provider/provider.dart';
import 'blocs/animation_bloc.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthBloc>(create: (context) => AuthBloc()),
        ChangeNotifierProvider<AnimationBloc>(create: (context) => AnimationBloc())
      ],
      child: MaterialApp(
        title: 'Facebook login',
        home: Login(),
      ),
    );
  }
}


