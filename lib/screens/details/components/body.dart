import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/models/Product.dart';
import 'package:fitforeverapp/screens/cart/cart_screen.dart';
import 'package:fitforeverapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  final Product product;
  final DocumentSnapshot item;

  const Body({Key key,
    this.product,
    this.item
  })
      : super(key: key);

  @override
  _BodyState createState() => _BodyState(item);
}

class _BodyState extends State<Body> {
  void initState() {
    super.initState();
    initUser();
  }
  initUser() async {
    user = await _auth.currentUser();
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  DocumentSnapshot item;
  _BodyState(this.item);
  var _size = ['Small', 'Medium', 'Large'];
  var currentSize = 'Medium';
  var qty = ['12', '11', '10', '9', '8', '7', '6', '5', '4', '3', '2', '1'];
  var currentQty = '1';
  int tot;
  @override
  Widget build(BuildContext context) {
    int qtyInt = int.parse(currentQty);
    int priceInt = int.parse(item.data['Price']);
    String title = item.data['Title'];
    String description = item.data['Description'];
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.white,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    //height: size.height,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  color: Colors.black12,
                                  height: 400,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 0, bottom: 10, left: 70),
                                          child: Image.asset(
                                            item.data['Image'],
                                            height: 400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 6.0, top: 374),
                                        child: SizedBox(
                                          height: 20,
                                          width: 70,
                                          child:
                                          RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                              side: BorderSide(color: Colors.transparent),
                                            ),
                                            color: Colors.white,
                                            textColor: Colors.blueAccent,
                                            child: Text(
                                              'On Sale',
                                              style: TextStyle(
                                                fontSize: 9,
                                                wordSpacing: 1,
                                              ),
                                            ),
                                            onPressed: (){},
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: kDefaultPaddin, top: kDefaultPaddin/2),
                                  child: Container(
                                    child: title != null ? Text(
                                      item.data['Title'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .copyWith(
                                        color: Colors.black,
                                      ),
                                    ):
                                    Text(
                                      item.data['Item'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Stack(
                                    children:<Widget> [
                                      Padding(
                                        padding: const EdgeInsets.only(left: kDefaultPaddin, top: kDefaultPaddin/2),
                                        child: Row(
                                          children: <Widget>[
                                            RichText(
                                              text: TextSpan(
                                                  text: " \₹ ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline
                                                      .copyWith(
                                                    color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: item.data['Price'],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline
                                                      .copyWith(
                                                    color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 240.0, top: 10),
                                        child: Text(
                                          'Availability:',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 325.0, top: 10),
                                        child: Text(
                                          'In Stock',
                                          style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: kDefaultPaddin * 2.5, top: kDefaultPaddin),
                                      child: Text(
                                        'Size :',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 160, top: 10),
                                      child: Container(
                                        height: 50,
                                        width: 120,
                                        child: DropdownButton<String>(
                                          items: _size.map((String dropDownStringItem) {
                                            return DropdownMenuItem<String>(
                                              value: dropDownStringItem,
                                              child: Text(dropDownStringItem,
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.blueAccent
                                                  )),
                                            );
                                          }).toList(),
                                          onChanged: (selectedSize){
                                            setState(() {
                                              this.currentSize = selectedSize;
                                            });
                                          },
                                          value: currentSize,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  height: 1,
                                  width: 500,
                                  color: Colors.black12,
                                ),
                                description != null ? Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    'Description:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                ):Text(''),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
                                  child: description != null ? Text(
                                    item.data['Description'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: kTextColor
                                    ),
                                  ): Text(''),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  height: 0.5,
                                  width: 500,
                                  color: Colors.black12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    'Shipping & Return:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80,right: 10),
                                  child: Text(
                                    "14 Days Free Returns.\n Cash on Delivery Available.\n Place your order and we will make sure it is delivered to you within the next 3-4 days.You can also opt for a next day delivery which is chargeable for ₹300. Items can be returned within a period of 14 days and payments will be refunded.",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: kTextColor
                                    ),
                                  ),
                                )
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 685, left: 8, right: 5),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
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
                height: 70,
                width: 400,
                //color: Colors.white,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 7, right: 6),
                      child: SizedBox(
                          height: 50,
                          width: 280,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.transparent)
                            ),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            child: Text(
                              'Add To Cart',
                              style: TextStyle(
                                wordSpacing: 5,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                tot = qtyInt * priceInt;
                              });
                              await Firestore
                                  .instance
                                  .collection('Cart')
                                  .document()
                                  .setData({'User':user.uid,
                                'Item': item.data['Title'],
                                'Image': item.data['Image'],
                                'Price': item.data['Price'],
                                'Size': currentSize,
                                'Quantity': currentQty,
                                'Amount': tot,
                              });
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context)=>CartScreen()
                                )
                                );
                            },
                          ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 7, right: 6),
                      child: Container(
                          height: 50,
                          width: 60,
                          child: DropdownButton<String>(
                            items: qty.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black
                                    )),
                              );
                            }).toList(),
                            onChanged: (selectedQty){
                              setState(() {
                                this.currentQty = selectedQty;
                              });
                            },
                            value: currentQty,
                          ),
                        ),
                    ),
                  ]
                ),
              ),
            ),
          ],
        ),
      );
    //);
  }
}
