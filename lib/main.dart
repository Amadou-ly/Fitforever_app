import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/screens/home/home_screen.dart';
import 'package:fitforeverapp/screens/login/login_screen.dart';
import 'package:fitforeverapp/screens/signup/signup_screen.dart';
import 'package:fitforeverapp/screens/wrapper.dart';
import 'package:fitforeverapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fitforeverapp/constants.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser >.value(
      value: AuthService().user ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FitForever',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        ),
        home: Wrapper(),
      ),
    );
  }
}