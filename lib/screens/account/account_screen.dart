import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/constants.dart';
import 'package:fitforeverapp/screens/cart/cart_screen.dart';
import 'package:fitforeverapp/screens/change_password/change_password_screen.dart';
import 'package:fitforeverapp/screens/contact/contact_screen.dart';
import 'package:fitforeverapp/screens/edit_profile/edit_screen.dart';
import 'package:fitforeverapp/screens/home/home_screen.dart';
import 'package:fitforeverapp/screens/login/login_screen.dart';
import 'package:fitforeverapp/screens/orders/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Loading.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }
  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return user != null ?  Scaffold(
      appBar: buildAppBar(context),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Amadou Tidiane Ly',
              style: TextStyle(
                color: Colors.white
              ),
              ),
              accountEmail: Text('${user?.email}',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kTextColor
                  ),
                  child: Icon(
                    Icons.person,
                    color: kTextLightColor,
                    size: 55,
                  ),
                )
              ),
              decoration: BoxDecoration(
                color: kTextLightColor,
              ),
            ),
            ListTile(
              title: Text('Orders'),
              trailing: Icon(Icons.shopping_basket),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> OrderScreen()));
              },
            ),
            ListTile(
              title: Text('Cart'),
              trailing: Icon(Icons.shopping_cart),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> CartScreen()));
              },
            ),
            ListTile(
              title: Text('Contact  Us'),
              trailing: Icon(Icons.message),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ContactScreen()));
              },
            ),
            ListTile(
              title: Text('Change  Password'),
              trailing: Icon(Icons.lock_outline),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ChangePasswordScreen()));
              },
            ),
            ListTile(
              title: Text('Log out'),
              trailing: SvgPicture.asset('assets/icons/logout.svg', color: kTextLightColor, height: 20),
              onTap: () async {
                Navigator.of(context).pop();
                try{
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (
                              BuildContext context
                              )=> LoginScreen()
                      )
                  );
                  return await FirebaseAuth.instance.signOut();
                }catch(e){
                  print(e.toString());
                  return null;
                }
              },
            ),
            Divider(height: 40),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.cancel),
              onTap: ()=> Navigator.of(context).pop(),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 150,
                child: Image.asset("assets/icons/logo.png"))
          ],
        ),
      ),
      body:Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 110, 20, 30),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: kTextLightColor)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: StreamBuilder(
                      stream: Firestore.instance.collection("Users").where("UserId", isEqualTo: user.uid).snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return Text(
                          '',
                        );
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: kTextColor
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.person),
                                      ),
                                      Text(
                                        snapshot.data.documents[0]['Username'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: kTextColor
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.mail),
                                      ),
                                      Text(
                                        '${user?.email}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: kTextColor
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.person_outline),
                                      ),
                                      Text(
                                        snapshot.data.documents[0]['FirstName'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: kTextColor
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.person_outline),
                                      ),
                                      Text(
                                        snapshot.data.documents[0]['LastName'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: kTextColor
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.local_shipping),
                                      ),
                                      Text(
                                        snapshot.data.documents[0]['Address'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: kTextColor
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.local_shipping),
                                      ),
                                      Text(
                                        snapshot.data.documents[0]['Address2'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: kTextColor
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.local_shipping),
                                      ),
                                      Text(
                                        snapshot.data.documents[0]['ZipCode'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: kTextColor
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.local_phone),
                                      ),
                                      Text(
                                        snapshot.data.documents[0]['Phone'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 155),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kTextColor,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 90,
                    color: kTextLightColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 750.0, left: 30, right: 30, bottom: 20),
                child: Container(
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.blue,
                    color: Colors.blueAccent,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (
                            BuildContext context
                            )=> EditScreen(),
                            )
                        );
                      },
                      child: Center(
                        child: Text(
                          'EDIT  PROFILE',
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
            ]
          ),
        ),
      ),
      //bottomNavigationBar: buildBottomNavigationBar(),
    ): Loading();
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Text(
          'My Account',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25),
        ),
      ),
      backgroundColor: Colors.white,
      elevation:50,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
