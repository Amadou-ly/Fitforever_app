import 'package:flutter/material.dart';

import 'components/body.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body:OrderBody(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 90),
        child: Text(
          'My Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: Colors.white10,
      elevation:100,
      leading: IconButton(icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
          onPressed: () => Navigator.pop(
              context)
      ),
      actions: <Widget>[
      ],
    );
  }
}
