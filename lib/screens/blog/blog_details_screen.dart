import 'package:flutter/material.dart';

import '../../constants.dart';

class BlogDetailScreen extends StatefulWidget {
  @override
  _BlogDetailScreenState createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
              child: Image.asset("assets/images/20200723_154301.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0 , top: 0, right: 220),
              child: Text(
                  'Simeon Panda',
                  style: TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0 , top: 2, right: 260),
              child: Text(
                  'Jul 15, 2020',
                  style: TextStyle(
                      color: kTextLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  )
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 2, right: 0),
                  child: Text(
                    'By :',
                    style: TextStyle(
                      color: kTextLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  )
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(left: 20 , top: 2, right: 00),
                  child: Text(
                      'Amadou Tidiane Ly',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 16
                      )
                  ),
                ),
                ],
              ),
            Padding(
              padding: EdgeInsets.only(top: 20,),
              child: Container(
                width: 400,
                height: 0.5,
                color: kTextLightColor,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Text(
                'Gaining the thirst for lifting in college, Simion Panda has been rising to the top from the first moment he started lifting weights at home.'
                ' From that point onwards, Simion now competes in shows around the world. He also judges competitions and is the owner of his own sportswear company.'
                ' Simeon has competed in bodybuilding shows worldwide, winning the European Championships in 2013 and earning himself Musclemania Pro status. '
                'He often judges bodybuilding and physique shows around the globe. Simeon is also the owner of his own clothing brand and sportswear company. '
                'Making him a successful entrepreneur.',
                style: TextStyle(
                  fontSize: 17,
                  color: kTextLightColor
                ),
              ),
            )
        ]
      ),
      )
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 100.0),
          child: Center(
            child: Text(
                'Simeon Panda',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
            ),
          ),
        )
      ],
    );
  }
}
