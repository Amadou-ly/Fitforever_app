import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitforeverapp/screens/account/account_screen.dart';
import 'package:fitforeverapp/screens/blog/blog_screen.dart';
import 'package:fitforeverapp/screens/cart/cart_screen.dart';
import 'package:fitforeverapp/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  initUser() async {
    user = await _auth.currentUser();
  }
  final screen = [
    HomeBody(),
    CartScreen(),
    BlogScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      selectedFontSize: 17,
      selectedItemColor: Colors.blueAccent,
      unselectedFontSize: 17,
      unselectedItemColor: Colors.black54,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home')
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
          ),
          title: Text('Cart'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people,
          ),
          title: Text('Blog'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          title: Text('Account'),
        ),
      ],
      onTap:(index){
        initUser();
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
