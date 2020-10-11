import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/screens/home/home_screen.dart';
import 'package:fitforeverapp/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitforeverapp/screens/Loading.dart';
import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController emailInputController;
  String error ="Nothing";
  TextEditingController pwdInputController;
  bool _showPassword = true;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading ?  Loading() :Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 110, 0, 0 ),
                  child: Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 200, 0, 0 ),
                  child: Text(
                    'There',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(270, 200, 0, 0 ),
                  child: Text(
                    '.',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 315, 20, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.transparent)
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextFormField(
                              controller: emailInputController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  labelText: 'EMAIL *',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextLightColor,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueAccent)
                                )
                              ),
                              validator: (input)=> !input.contains('@') ? 'Enter a Valid Email' : null,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 28.0),
                              child: TextFormField(
                                controller: pwdInputController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon:IconButton(
                                      icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                                      onPressed: _togglevisibility,
                                    ),
                                    labelText: 'PASSWORD *',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kTextLightColor,
                                  )
                                ),
                                obscureText: _showPassword,
                                validator: (input)=> input.length < 6  ? 'Enter at least 6 characters' : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 130 , top: 00, bottom: 10),
                              child: Container(
                                child: InkWell(
                                  onTap: (){},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 610.0, left: 30, right: 30),
                  child: Container(
                    height: 50,
                    width: 400,
                    child: RaisedButton(
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.transparent)
                        ),
                      color: Colors.blueAccent,
                        onPressed: () async {
                          if(formKey.currentState.validate()){
                            setState(() => loading = true);
                            try{
                              AuthResult result = await FirebaseAuth
                                  .instance.
                              signInWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text);
                              FirebaseUser user = result.user;
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (
                                          BuildContext context
                                          )=> HomeScreen()
                                  )
                              );
                              if(result == null){
                                print(error);
                                setState(() {
                                  loading = false;
                                });
                              }
                            } catch(e){
                              print(e.toString());
                              setState(() {
                                loading = false;
                              });
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error",
                                        style: TextStyle(color: Colors.red),),
                                      content: Text("COULD NOT LOG IN. \n \nCHECK EMAIL AND PASSWORD."
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  }
                              );
                              return null;
                            }

                          }
                        },
                        child: Center(
                          child: Text(
                            'LOGIN',
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
                Padding(
                  padding: const EdgeInsets.only(top: 690.0, left: 30, right: 30),
                  child: Container(
                    height: 50,
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Container(
                                height: 30,
                                width: 40,
                                child: SvgPicture.asset("assets/icons/google.svg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Log In with Google',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 780.0, left: 80, right: 30),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'New To FitForever ?',
                        style: TextStyle(
                          color: kTextLightColor,
                          fontSize: 16
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (
                                        BuildContext context
                                        )=> SignupScreen()
                                )
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
