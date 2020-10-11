import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/constants.dart';
import 'package:fitforeverapp/models/Product.dart';
import 'package:fitforeverapp/screens/Loading.dart';
import 'package:fitforeverapp/screens/details/details_screen.dart';
import 'package:fitforeverapp/screens/men/men_screen.dart';
import 'package:fitforeverapp/screens/shop/components/item_card.dart';
import 'package:fitforeverapp/screens/women/women_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class HomeBody extends StatefulWidget {

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  int count;
  String welcome = "";
  @override
  void initState() {
    super.initState();
    initUser();
    countDocuments();
  }
  void countDocuments() async {
    QuerySnapshot _myDoc = await Firestore.instance.collection('Items').getDocuments();
    List<DocumentSnapshot> _myDocCount = _myDoc.documents;
    print(_myDocCount.length);  // Count of Documents in Collection
    setState(() {
      count = _myDocCount.length;
    });
  }
  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return user != null ? Scaffold(
      appBar: AppBar(
        title: Stack(
            children: <Widget>[
              StreamBuilder(
                  stream: Firestore.instance.collection("Users").where("UserId", isEqualTo: user.uid).snapshots(),
                  builder: (context, snapshot){
                      if (!snapshot.hasData) return Text(
                        '',
                      );
                    return Stack(
                      children: <Widget>[
                        Text(
                          'Hello,',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 65),
                          child: Text(snapshot.data.documents[0]['LastName'],
                            style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          ),
                        ),
                      ],
                    );
                  },
                )
            ],
          ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.search,
                  color: Colors.black
              ),
              onPressed: () {} ,
            ),
          ),
        ],
      ) ,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(right: 240),
                child: Icon(Icons.close),
              ),
              onTap: ()=> Navigator.of(context).pop(),
            ),
            Container(
                height: 60,
                child: Image.asset("assets/icons/logo.png")
            ),
            Divider(height: 10),
            ListTile(
              title: Row(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/user.svg', color: Colors.black, height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Men',
                    style: TextStyle(
                      fontSize: 18
                    ),
                    ),
                  ),
                ],
              ),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (
                            BuildContext context)=> MenScreen()
                    )
                );
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/short.svg', color: Colors.black54, height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Shorts',
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (
                                  BuildContext context)=> MenScreen()
                          )
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/shirts.svg', color: Colors.black54, height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Shirts',
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (
                                  BuildContext context)=> MenScreen()
                          )
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/jogger.svg', color: Colors.black54, height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Joggers',
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (
                                  BuildContext context)=> MenScreen()
                          )
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/sweatshirt.svg', color: Colors.black, height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Hoodies',
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (
                                  BuildContext context)=> MenScreen()
                          )
                      );
                    },
                  ),
                ],
              ),
            ),
            Divider(height: 10),
            ListTile(
              title: Row(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/woman.svg', color: Colors.black, height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Women',
                    style: TextStyle(
                        fontSize: 18
                    ),
                    ),
                  ),
                ],
              ),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (
                            BuildContext context)=> WomenScreen()
                    )
                );
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/top.svg', color: Colors.black54, height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Tops',
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (
                                  BuildContext context)=> MenScreen()
                          )
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/legging.svg', color: Colors.black54, height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Leggings',
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (
                                  BuildContext context)=> MenScreen()
                          )
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/tracksuit.svg', color: Colors.grey, height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Sets',
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (
                                  BuildContext context)=> MenScreen()
                          )
                      );
                    },
                  ),
                ],
              ),
            ),
            Divider(height: 10),
            ListTile(
              title: Row(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/feet.svg', color: Colors.black, height: 28),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Shoes',
                    style: TextStyle(
                      fontSize: 18
                    ),
                    ),
                  ),
                ],
              ),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            Container(height: 30)
          ],
        ),
      ),
      body: new ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/background.jpg',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45.0, left: 20),
                  child: (
                    Text(
                      'New Arrivals',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                  )
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, left: 20),
                  child: (
                      Text(
                        'Athletic Shorts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 130.0, left: 20, right: 100),
                  child: (
                      Text(
                        'Leg day, today? From cycling shorts, to running and compression shorts, no matter what your activity is, our range of product has got you covered.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
          Container(child: SizedBox(height: kDefaultPaddin)),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:120.0),
              child: Text(
                'Latest Products',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (
                                                BuildContext context)=> DetailsScreen(item:item)
                                        )
                                    );
                                  },
                                  child: Padding(
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
                                          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 5, horizontal: kDefaultPaddin / 4),
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
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:60.0),
              child: Text(
                  'Browse Top Selling Products',
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),
              ),
            ),
          ),
          Container(child: SizedBox(height: 22)),
          Container(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: StreamBuilder(
                    stream: Firestore.instance.collection("Items").snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data.documents.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 0,
                          childAspectRatio: 0.67,
                        ),
                        itemBuilder:(context, index) {
                          DocumentSnapshot item = snapshot.data.documents[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (
                                          BuildContext context)=> DetailsScreen(item:item)
                                  )
                              );
                            },
                            child: Padding(
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
                                    padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 6, horizontal: kDefaultPaddin / 4),
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
                            ),
                          );
                        }
                      );
                    }else {
                      return Loading();
                    }
                  }
                ),
              ),
            ),
          SizedBox(height: 20),
        ],
      ),
    ): Loading();
  }
}
