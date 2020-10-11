//import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/screens/Loading.dart';
import 'package:fitforeverapp/screens/account/account_screen.dart';
import 'package:fitforeverapp/screens/home/home_screen.dart';
import 'package:fitforeverapp/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  TextEditingController usernameInputController;
  TextEditingController emailInputController;
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController addressInputController;
  TextEditingController address2InputController;
  TextEditingController zipCodeInputController;
  TextEditingController phoneInputController;
  String username;
  String firstName;
  String lastName;
  String address;
  String address2;
  String zipCode;
  String phone;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    initUser();
    usernameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    addressInputController = new TextEditingController();
    address2InputController = new TextEditingController();
    zipCodeInputController = new TextEditingController();
    phoneInputController = new TextEditingController();

  }
  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return user != null ?  Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: buildAppBar(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: StreamBuilder(
                    stream: Firestore.instance.collection("Users").where("UserId", isEqualTo: user.uid).snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container(
                        color: Colors.white,
                      );
                      return Stack(
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
                            padding: EdgeInsets.fromLTRB(80, 100, 0, 0),
                            child: Text(
                              'Edit Your Profile',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(325, 100, 0, 0),
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
                            padding: EdgeInsets.fromLTRB(15, 150, 15, 10),
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
                                        controller: usernameInputController,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.person),
                                            hintText: snapshot.data.documents[0]['Username'],
                                            labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kTextLightColor,

                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blueAccent)
                                            )
                                        ),
                                        validator: (input) =>
                                        input.length == 0
                                            ? 'Enter a Username'
                                            : null,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 0.0),
                                        child: TextFormField(
                                          controller: firstNameInputController,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.person_outline),
                                              hintText: snapshot.data.documents[0]['FirstName'],
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kTextLightColor,
                                              )
                                          ),
                                          validator: (input) =>
                                          input.length < 8
                                              ? 'Enter at least 8 characters'
                                              : null,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 0.0),
                                        child: TextFormField(
                                          controller: lastNameInputController,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.person_outline),
                                              hintText: snapshot.data.documents[0]['LastName'],
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kTextLightColor,
                                              )
                                          ),
                                          validator: (input) =>
                                          input.length < 8
                                              ? 'Enter at least 8 characters'
                                              : null,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 0.0),
                                        child: TextFormField(
                                          controller: addressInputController,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.local_shipping),
                                              hintText: snapshot.data.documents[0]['Address'],
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kTextLightColor,
                                              )
                                          ),
                                          validator: (input) =>
                                          input.length < 8
                                              ? 'Enter at least 8 characters'
                                              : null,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 0.0),
                                        child: TextFormField(
                                          controller: address2InputController,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.local_shipping),
                                              hintText: snapshot.data.documents[0]['Address2'],
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kTextLightColor,
                                              )
                                          ),
                                          validator: (input) =>
                                          input.length < 8
                                              ? 'Enter at least 8 characters'
                                              : null,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 0.0),
                                        child: TextFormField(
                                          controller: zipCodeInputController,
                                          keyboardType: TextInputType
                                              .numberWithOptions(),
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.local_shipping),
                                              hintText: snapshot.data.documents[0]['ZipCode'],
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kTextLightColor,
                                              )
                                          ),
                                          validator: (input) =>
                                          input.length < 8
                                              ? 'Enter at least 8 characters'
                                              : null,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 30.0),
                                        child: TextFormField(
                                          controller: phoneInputController,
                                          keyboardType: TextInputType
                                              .numberWithOptions(),
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.local_phone),
                                              hintText: snapshot.data.documents[0]['Phone'],
                                              labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kTextLightColor,
                                                fontSize: 16,
                                              )
                                          ),
                                          validator: (input) =>
                                          input.length < 8
                                              ? 'Enter at least 8 characters'
                                              : null,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0,
                                            left: 30,
                                            right: 30,
                                            bottom: 20),
                                        child: Container(
                                          height: 50,
                                          child: Material(
                                            borderRadius: BorderRadius.circular(
                                                30.0),
                                            shadowColor: Colors.blue,
                                            color: Colors.blueAccent,
                                            elevation: 7.0,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  username = usernameInputController.text;
                                                  firstName = firstNameInputController.text;
                                                  lastName = lastNameInputController.text;
                                                  address = addressInputController.text;
                                                  address2 = address2InputController.text;
                                                  zipCode= zipCodeInputController.text;
                                                  phone = phoneInputController.text;
                                                });
                                                  if (username.length < 1){
                                                    setState(() {
                                                      username = snapshot.data.documents[0]['Username'];
                                                    });
                                                  }
                                                if (firstName.length < 1){
                                                  setState(() {
                                                    firstName = snapshot.data.documents[0]['FirstName'];
                                                  });
                                                }
                                                if (lastName.length < 1){
                                                  setState(() {
                                                    lastName = snapshot.data.documents[0]['LastName'];
                                                  });
                                                }
                                                if (address.length < 1){
                                                  setState(() {
                                                    address = snapshot.data.documents[0]['Address'];
                                                  });
                                                }
                                                if (address2.length < 1){
                                                  setState(() {
                                                    address2 = snapshot.data.documents[0]['Address2'];
                                                  });
                                                }
                                                if (zipCode.length < 1){
                                                  setState(() {
                                                    zipCode = snapshot.data.documents[0]['ZipCode'];
                                                  });
                                                }
                                                if (phone.length < 1){
                                                  setState(() {
                                                    phone = snapshot.data.documents[0]['Phone'];
                                                  });
                                                }
                                                Firestore.instance.collection("Users").document(user.uid).updateData({
                                                  'Username': username,
                                                  'FirstName':firstName,
                                                  'LastName':lastName,
                                                  'Address':address,
                                                  'Address2':address2,
                                                  'ZipCode':zipCode,
                                                  'Phone':phone
                                                });
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (
                                                            BuildContext context
                                                            )=> HomeScreen()
                                                    )
                                                );
                                              },
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
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ): Loading();
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: ()=> Navigator.pop(context),
      ),
      backgroundColor: Colors.white,
      actions: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 135.0),
            child: Text(
              'User  Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
