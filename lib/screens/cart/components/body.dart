import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/constants.dart';
import 'package:fitforeverapp/screens/checkout/checkout.dart';
import 'package:fitforeverapp/screens/details/components/Photo.dart';
import 'package:fitforeverapp/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitforeverapp/models/Product.dart';

import '../../Loading.dart';

class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser user;
  int granTot;
  @override
  void initState() {
    super.initState();
    initUser();
  }
  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }
  getCartTotal() async {
    var cartTotal = 0;
    QuerySnapshot snapshot = await Firestore.instance
        .collection('Cart')
        .where("User", isEqualTo: user.uid)
        .getDocuments();

    if (snapshot == null) {
      return;
    }

    snapshot.documents.forEach((doc) {
      cartTotal = cartTotal + doc.data['Amount'];
    });
    setState(() {
      granTot = cartTotal;
    });
  }

  Widget build(BuildContext context) {
    return user != null ? Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: StreamBuilder(
                  stream: Firestore.instance.collection("Cart").where("User", isEqualTo: user.uid).snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.documents.length != 0) {
                        return Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30, top: 10),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    snapshot.data.documents.length.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    ' Items',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 280.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.transparent)
                                ),
                                color: Colors.white,
                                textColor: Colors.blueAccent,
                                child: Text(
                                  'Empty Cart',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Firestore.instance.collection("Cart").where("User", isEqualTo: user.uid).getDocuments().then((snapshot){
                                    for (DocumentSnapshot ds in snapshot.documents){
                                      ds.reference.delete();
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: 300),
                          child: Text('Your Shopping Cart is Empty !',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        );
                      }
                    }else{
                      return Text('');
                    }
                  }
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0  , left: 0, bottom: 10),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: StreamBuilder(
                      stream: Firestore.instance.collection("Cart").where("User", isEqualTo: user.uid).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data.documents.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder:(context, index) {
                                DocumentSnapshot item = snapshot.data.documents[index];
                                return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 0),
                                          height: 1,
                                          width: 500,
                                          color: Colors.black12,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10.0),
                                          child: Container(
                                              padding: EdgeInsets.all(kDefaultPaddin / 2),
                                              height: 190,
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius: BorderRadius.circular(16)
                                              ),
                                              child: GestureDetector(
                                                onTap: (){
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (
                                                              BuildContext context)=> Photo(item: item)
                                                      )
                                                  );
                                                },
                                                child: Image.asset(item.data['Image'])
                                              )
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 160 , top: 30),
                                          child: Text(
                                              item.data['Item'],
                                              style: TextStyle(color: kTextColor)
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 160, top: 60),
                                          child: Text(
                                            ' \₹ ',
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 175 , top: 60),
                                          child: Text(
                                            item.data['Price'],
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 160 , top: 90),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Quantity:',
                                                style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 18.0),
                                                child: Text(
                                                  item.data['Quantity'],
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 160 , top: 120),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Size:',
                                                style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 18.0),
                                                child: Text(
                                                  item.data['Size'],
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 160 , top: 150),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Amount:',
                                                style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Text(
                                                  ' \₹ ',
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 2),
                                                child: Text(
                                                  item.data['Amount'].toString(),
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 180 , top: 180, bottom: 20),
                                          child: Container(
                                            height: 30,
                                            width: 125,
                                            child: RaisedButton(
                                              color: Colors.white,
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.delete,
                                                    color: kTextColor,
                                                  ),
                                                  Text(
                                                    'Remove',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: kTextColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              onPressed: () async {
                                                await Firestore.instance.runTransaction((Transaction myTransaction) async {
                                                  await myTransaction.delete(snapshot.data.documents[index].reference);
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                              }
                          );
                        }else {
                          return Text('');
                        }
                      }
                  ),
                ),
              ),
            ),
            StreamBuilder(
                stream: Firestore.instance.collection("Cart").where("User", isEqualTo: user.uid).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasData) {
                  getCartTotal();
                  if (snapshot.data.documents.length != 0) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 18, bottom: 10),
                      child: Container(
                        height: 80,
                        width: 376,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 2.0,
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            border: Border.all(
                                width: 1,
                                color: Colors.black12
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, left: 165),
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.transparent)
                                  ),
                                  color: Colors.blueAccent,
                                  textColor: Colors.white,
                                  child: Text(
                                    'Checkout',
                                    style: TextStyle(
                                      wordSpacing: 5,
                                      fontSize: 22,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CheckoutScreen()));
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, left: 20),
                              child: Container(
                                height: 90,
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10.0),
                                      child: Text(
                                        'Total',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: kTextLightColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 35.0),
                                      child: Text(
                                        ' \₹',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 35.0, left: 23),
                                      child: granTot != null ?Text(
                                        granTot.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ):Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }else{
                  return Text('');
                }
              }
            ),
          ],
        ),
      ),
    ):Loading();
  }
}
