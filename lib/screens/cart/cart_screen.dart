import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/screens/Loading.dart';
import 'package:fitforeverapp/screens/cart/components/body.dart';
import 'package:fitforeverapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
    return user != null ?Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body:CartBody(),
    ): Loading();
  }

  AppBar buildAppBar(BuildContext context) {

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back,
          color: Colors.black),
        onPressed:() {
          Navigator.of(
              context
          ).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen()
              )
          );
        }
        ,
      ),
      backgroundColor: Colors.white10,
      elevation:100,
      actions: <Widget>[
        StreamBuilder(
          stream: Firestore.instance.collection("Cart").where("User", isEqualTo: user.uid).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 15),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      snapshot.data.documents.length.toString(),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }else{
              return Text('');
            }
          }
        )
      ],
    );
  }
}
