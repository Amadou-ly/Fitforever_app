import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/screens/home/home_screen.dart';
import 'package:fitforeverapp/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';
import '../Loading.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool _showPassword = true;
  bool _showPassword2 = true;
  TextEditingController usernameInputController;
  TextEditingController emailInputController;
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;
  TextEditingController addressInputController;
  TextEditingController address2InputController;
  TextEditingController zipCodeInputController;
  TextEditingController phoneInputController;

  @override
  initState() {
    usernameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    addressInputController = new TextEditingController();
    address2InputController = new TextEditingController();
    zipCodeInputController = new TextEditingController();
    phoneInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading ?  Loading() :Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 00.0),
                          child: Center(
                            child: Image(
                              image: AssetImage('assets/logo.png'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(140, 100, 0, 0 ),
                        child: Text(
                          'Sign  Up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(263, 100, 0, 0 ),
                        child: Text(
                          '.',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 150, 15, 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.transparent)
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person),
                                        labelText: 'USERNAME *',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kTextLightColor,

                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.blueAccent)
                                        )
                                    ),
                                    validator: (input)=> input.length==0 ? 'Enter a Username' : null,
                                    controller: usernameInputController,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.mail),
                                          labelText: 'EMAIL *',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextLightColor,
                                          )
                                      ),
                                      validator: (input)=> !input.contains('@') ? 'Enter a Valid Email' : null,
                                      controller: emailInputController,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person_outline),
                                          labelText: 'FIRST  NAME *',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextLightColor,
                                          )
                                      ),
                                      validator: (input)=> input.length==0 ? 'Enter a First Name' : null,
                                      controller: firstNameInputController,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person_outline),
                                          labelText: 'LAST NAME *',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextLightColor,
                                          )
                                      ),
                                      validator: (input)=> input.length==0 ? 'Enter a Last Name' : null,
                                      controller: lastNameInputController,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                                            onPressed: (){
                                              setState(() {
                                                _showPassword = ! _showPassword;
                                              });
                                            },
                                          ),
                                          prefixIcon: Icon(Icons.lock),
                                          labelText: 'PASSWORD *',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextLightColor,
                                          )
                                      ),
                                      obscureText: _showPassword,
                                      validator: (input)=> input.length < 6  ? 'Enter at least 6 characters' : null,
                                      controller: pwdInputController,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(_showPassword2 ? Icons.visibility : Icons.visibility_off),
                                            onPressed: (){
                                              setState(() {
                                                _showPassword2 = ! _showPassword2;
                                              });
                                            },
                                          ),
                                          prefixIcon: Icon(Icons.lock),
                                          labelText: 'CONFIRM  PASSWORD *',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextLightColor,
                                          )
                                      ),
                                      obscureText: _showPassword2,
                                      validator: (input)=> input.length < 6  ? 'Enter at least 6 characters' : null,
                                      controller: confirmPwdInputController,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.local_shipping),
                                          labelText: 'ADDRESS *',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextLightColor,
                                          )
                                      ),
                                      validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                                      controller: addressInputController,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.local_shipping),
                                          labelText: 'ADDRESS  LINE  2 (Optional)',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextLightColor,
                                          )
                                      ),
                                      controller: address2InputController,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.numberWithOptions(),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.local_shipping),
                                          labelText: 'ZIPCODE *',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextLightColor,
                                          )
                                      ),
                                      validator: (input)=> input.length != 6  ? 'Enter a 6 digits zipcode' : null,
                                      controller: zipCodeInputController,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.numberWithOptions(),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.local_phone),
                                          labelText: 'PHONE  NUMBER *',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kTextLightColor,
                                            fontSize: 16,
                                          )
                                      ),
                                      validator: (input)=> input.length != 10  ? 'Enter a valid phonenumber' : null,
                                      controller: phoneInputController,
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
                        padding: const EdgeInsets.only(top: 1030.0, left: 30, right: 30),
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
                                if(_formKey.currentState.validate()){
                                  setState(() => loading = true);
                                  if(pwdInputController.text == confirmPwdInputController.text){
                                    AuthResult result = await FirebaseAuth
                                        .instance.
                                    createUserWithEmailAndPassword(
                                        email: emailInputController.text,
                                        password: pwdInputController.text);
                                    FirebaseUser user = result.user;
                                    await Firestore
                                        .instance
                                        .collection('Users')
                                        .document(user.uid)
                                        .setData({'UserId':user.uid,
                                          'Username': usernameInputController.text,
                                          'FirstName':firstNameInputController.text,
                                          'LastName':lastNameInputController.text,
                                          'Address':addressInputController.text,
                                          'Address2':address2InputController.text,
                                          'ZipCode':zipCodeInputController.text,
                                          'Phone':phoneInputController.text
                                    });
                                    setState(() {
                                      loading = false;
                                    });
                                  }else{
                                    setState(() {
                                      loading = false;
                                    });
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Error"),
                                            content: Text("The passwords do not match"),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text("Close"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  }
                                }
                              },
                              child: Center(
                                child: Text(
                                  'GET  STARTED',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    backgroundColor: Colors.blueAccent
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1125.0, left: 80, right: 30,bottom: 20),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Already Registered  ?',
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
                                              )=> LoginScreen()
                                      )
                                  );
                                },
                                child: Text(
                                  'Log In',
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
          ),
        ),
      ),
    );
  }
}
