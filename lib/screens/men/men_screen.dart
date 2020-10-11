import 'package:fitforeverapp/models/Product.dart';
import 'package:fitforeverapp/screens/details/details_screen.dart';
import 'package:fitforeverapp/screens/shop/components/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class MenScreen extends StatefulWidget {
  @override
  _MenScreenState createState() => _MenScreenState();
}

class _MenScreenState extends State<MenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: kTextLightColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset("assets/icons/short.svg", color: Colors.white, height: 110,),
                            onPressed:null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Shorts',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: kTextLightColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset("assets/icons/shirts.svg", color: Colors.white, height: 110,),
                            onPressed:null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Shirts',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: kTextLightColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset("assets/icons/jogger.svg", color: Colors.white, height: 110,),
                            onPressed:null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Joggers',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: kTextLightColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset("assets/icons/sweatshirt.svg", color: Colors.white, height: 110,),
                            onPressed:null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Hoodies',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.55,
                  ),
                  itemBuilder:(context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                              product: products[index]),
                        ),
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      )
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
            'Men',
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
