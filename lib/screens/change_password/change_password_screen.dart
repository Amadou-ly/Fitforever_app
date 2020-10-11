import 'package:fitforeverapp/constants.dart';
import 'package:flutter/material.dart';
class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _showPassword = true;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
  bool _showPassword2 = true;
  void _togglevisibility2() {
    setState(() {
      _showPassword2 = !_showPassword2;
    });
  }
  bool _showPassword3 = true;
  void _togglevisibility3() {
    setState(() {
      _showPassword3 = !_showPassword3;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: buildAppBar(context),
      body: Container(
        child: (
        Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kTextColor,
                ),
                child: Icon(Icons.lock,
                        size: 90,
                        color: kTextLightColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 160, left: 70),
              child: Text(
                'Change Your Password',
                style: TextStyle(
                  color: kTextLightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              )
            ),
            Padding(
                padding: const EdgeInsets.only(top: 200, left: 50, right: 50),
                child: Text(
                  'Confirm your current Password and enter the new Password twice.',
                  style: TextStyle(
                      color: kTextLightColor,
                      fontSize: 18
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.only(top: 280, left: 50, right: 50),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
                          child: Text(
                            'Current Password',
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 20,
                            ),
                          )
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: kTextLightColor,
                                width: 2.0,
                              ),
                            ),
                            suffixIcon:IconButton(
                              icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                              onPressed: _togglevisibility,
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                            )
                        ),
                        obscureText: _showPassword,
                        validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 25, left: 50, right: 50, bottom: 10),
                          child: Text(
                            'New Password',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 20,
                            ),
                          )
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: kTextLightColor,
                                width: 2.0,
                              ),
                            ),
                            suffixIcon:IconButton(
                              icon: Icon(_showPassword2 ? Icons.visibility : Icons.visibility_off),
                              onPressed: _togglevisibility2,
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                            )
                        ),
                        obscureText: _showPassword2,
                        validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 25, left: 30, right: 30, bottom: 10),
                          child: Text(
                            'Confirm New Password',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 20,
                            ),
                          )
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                            color: kTextLightColor,
                            width: 2.0,
                            ),
                          ),
                            suffixIcon:IconButton(
                              icon: Icon(_showPassword3 ? Icons.visibility : Icons.visibility_off),
                              onPressed: _togglevisibility3,
                            ),
                        ),
                        obscureText: _showPassword3,
                        validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 30, right: 30),
                        child: Container(
                          height: 50,
                          child: Material(
                            borderRadius: BorderRadius.circular(30.0),
                            shadowColor: Colors.black,
                            color: kTextColor,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: (){},
                              child: Center(
                                child: Text(
                                  'SAVE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        )
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
   return AppBar(
     leading: IconButton(
       icon: Icon(Icons.arrow_back, color: Colors.black),
       onPressed:() {
         Navigator.pop(context);
       }
     ),
     backgroundColor: Colors.white12,
     elevation: 500,
     actions: <Widget>[],
   );
  }
}
