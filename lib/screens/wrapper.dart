import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/screens/Loading.dart';
import 'package:fitforeverapp/screens/home/home_screen.dart';
import 'package:fitforeverapp/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Timer timer;
  bool which = true;
  delay() {
    timer = new Timer(const Duration(milliseconds: 400), () {
      setState(() {
        which = false;
      });
    });
  }
  @override
  void initState(){
    super.initState();
    delay();
  }
  Widget build(BuildContext context) {

    final user = Provider.of<FirebaseUser>(context);
    if(user == null){
      if(which == true){
        return Loading();
      }else{
        return LoginScreen();
      }
    }else{
      return HomeScreen();
    }
  }
}
