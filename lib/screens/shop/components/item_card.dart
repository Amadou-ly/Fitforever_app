import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'package:fitforeverapp/models/Product.dart';

import '../../Loading.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: StreamBuilder(
            stream: Firestore.instance.collection("Items").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData){
                return Container(
                  width: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot item = snapshot.data.documents[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(kDefaultPaddin / 2),
                                height: 220,
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                child: Image.asset(item.data['Image'])
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4, horizontal: kDefaultPaddin / 4),
                              child: Text(
                                  item.data['Title'],
                                  style: TextStyle(color: kTextLightColor)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 4),
                              child: Row(
                                children: <Widget>[
                                  Text('₹',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)
                                  ),
                                  Text(
                                    item.data['Price'],
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }else{
                return Loading();
              }
            }
        ),
      ),
    );
  }
}