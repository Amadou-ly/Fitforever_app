import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  final DocumentSnapshot item;
  const Photo({Key key, this.item}) : super(key: key);
  get photo => item.data['Image'];
  get product=> item.data['Item'];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 500,
        backgroundColor: Colors.black87,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.cancel,
            size: 50,
            color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Center(child: Image.asset(photo)),
              SizedBox(height: 20),
              Text(product,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
