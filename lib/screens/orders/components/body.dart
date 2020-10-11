import 'package:flutter/material.dart';
import 'package:fitforeverapp/screens/details/details_screen.dart';
import 'package:fitforeverapp/models/Product.dart';

import '../../../constants.dart';

class OrderBody extends StatefulWidget {
  @override
  _OrderBodyState createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kTextColor,
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10, right: 8),
            child: GridView.builder(
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context,index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                product: products[index]
                            ),
                          )
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 320,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                          ),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0, left: 10),
                                child: Container(
                                    padding: EdgeInsets.all(kDefaultPaddin / 2),
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: Image.asset(products[0].image)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 150.0, left: 20),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 1,
                                  width: 350,
                                  color: kTextLightColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 110 , top: 30),
                                child: Text(
                                    products[0].title,
                                    style: TextStyle(color: kTextColor,
                                    fontWeight: FontWeight.bold)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20 , top: 130),
                                child: Text(
                                  '₹${products[0].price}',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 110 , top: 60),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                        '2 Items',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 200 , top: 60),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Size:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: Text(
                                        'Medium',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 110 , top: 90),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Status:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: Text(
                                        'Delivered',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 110 , top: 120),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Order Placed on',
                                      style: TextStyle(color: kTextLightColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Jul 10,  2020',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 245 , top: 220),
                                child: Container(
                                  height: 30,
                                  width: 130,
                                  //color: Colors.transparent,
                                  child: RaisedButton(
                                    color: Colors.white,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.refresh,
                                          color: Colors.blueAccent,
                                        ),
                                        Text(
                                          ' Reorder',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blueAccent,
                                          ),
                                        )
                                      ],
                                    ),
                                    onPressed: (){},
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20 , top: 170),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Order No:',
                                      style: TextStyle(color: kTextLightColor, fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        '001229',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 200, left: 20),
                                      child: Text(
                                        'Shipped to:',
                                        style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 225, left: 20),
                                      child: Stack(
                                        children: [
                                          Text(
                                            'Amadou Tidiane Ly',
                                            style: TextStyle(color: kTextColor),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 18.0),
                                            child: Text(
                                              'Gunjur Palya,  Bangalore',
                                              style: TextStyle(color: kTextColor),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 36.0),
                                            child: Text(
                                              '560087',
                                              style: TextStyle(color: kTextColor),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 54.0),
                                            child: Text(
                                              'India',
                                              style: TextStyle(color: kTextColor),
                                            ),
                                          ),
                                        ]
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );  }
}
