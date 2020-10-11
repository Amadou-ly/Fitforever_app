import 'package:flutter/material.dart';

class WomenScreen extends StatefulWidget {
  @override
  _WomenScreenState createState() => _WomenScreenState();
}

class _WomenScreenState extends State<WomenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: Icon(Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.of(context).pop(context);

          }
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 140, top: 15),
          child: Text(
            'Women',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.search,
              color: Colors.black,
              size: 25),
        )
      ],
    );
  }
}
