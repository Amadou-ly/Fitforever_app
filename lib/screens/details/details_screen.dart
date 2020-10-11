
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitforeverapp/constants.dart';
import 'package:fitforeverapp/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitforeverapp/models/Product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitforeverapp/screens/details/components/body.dart';
class DetailsScreen extends StatelessWidget {
  final Product product;
  final DocumentSnapshot item;


  const DetailsScreen({Key key, this.product, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(item: item),
    );
  }



  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black12,
      elevation: 300,
      title: Text(
        item.data['Title'],
        style: Theme.of(context)
            .textTheme
            .headline
            .copyWith(
          color: Colors.black,
        ),
      ),
      leading: IconButton(icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
      ),
          onPressed: () => Navigator.pop(
              context)
      ),
      actions: <Widget>[
        IconButton(icon: Icon(
            Icons.shopping_cart,
            color: Colors.black87),
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (
                          BuildContext context)=> CartScreen()
                  )
              );
            }
            ),

        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
