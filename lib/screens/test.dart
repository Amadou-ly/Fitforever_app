import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitforeverapp/screens/Loading.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: Firestore.instance.collection("Items").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                  DocumentSnapshot item = snapshot.data.documents[index];
                  return Column(
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
                            snapshot.data.documents[0]['Title'],
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
                  );
                  },
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
