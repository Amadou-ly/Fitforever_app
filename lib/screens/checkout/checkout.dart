import 'package:fitforeverapp/constants.dart';
import 'package:fitforeverapp/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedRadio = 0;
  int selectedRadio2 = 0;
  bool visible = true;
  bool curAddress = true;
  bool difAddress = true;

  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }
  setSelectedRadio2(int val){
    setState(() {
      selectedRadio2 = val;
    });
  }
  curDisappear(){
    setState(() {
      curAddress = false;
      difAddress = true;
    });
  }
  difDisappear(){
    setState(() {
      curAddress = true;
      difAddress = false;
    });
  }
  disappear(){
    setState(() {
      visible = false;
    });
  }
  disappear2(){
    setState(() {
      visible = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white10,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
                        child: Container(
                          height: 95,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: kTextLightColor,
                                style: BorderStyle.solid,
                                width: 0.7,
                              ),
                              color: Colors.white
                          ),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 7.0, left: 10),
                                child: Container(
                                    padding: EdgeInsets.all(kDefaultPaddin / 4),
                                    height: 80,
                                    decoration: BoxDecoration(
                                    border: Border.all(
                                    color: Colors.brown,
                                    style: BorderStyle.solid,
                                    width: 0.7,
                                    ),
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Image.asset(products[0].image)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90 , top: 15),
                                child: Text(
                                    products[0].title,
                                    style: TextStyle(color: kTextColor)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90 , top: 40),
                                child: Text(
                                  '₹${products[0].price}',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90 , top: 70),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Quantity:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 200 , top: 70),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Amount:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: Text(
                                        '₹ 1999.99',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                        child: Container(
                          height: 95,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: kTextLightColor,
                                style: BorderStyle.solid,
                                width: 0.7,
                              ),
                              color: Colors.white
                          ),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 7.0, left: 10),
                                child: Container(
                                    padding: EdgeInsets.all(kDefaultPaddin / 4),
                                    height: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.brown,
                                        style: BorderStyle.solid,
                                        width: 0.7,
                                      ),
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Image.asset(products[0].image)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90 , top: 15),
                                child: Text(
                                    products[0].title,
                                    style: TextStyle(color: kTextColor)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90 , top: 40),
                                child: Text(
                                  '₹${products[0].price}',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90 , top: 70),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Quantity:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 200 , top: 70),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Amount:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: Text(
                                        '₹ 1999.99',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
                        child: Container(
                          height: 95,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: kTextLightColor,
                                style: BorderStyle.solid,
                                width: 0.7,
                              ),
                              color: Colors.white
                          ),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 7.0, left: 10),
                                child: Container(
                                    padding: EdgeInsets.all(kDefaultPaddin / 4),
                                    height: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.brown,
                                        style: BorderStyle.solid,
                                        width: 0.7,
                                      ),
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Image.asset(products[0].image)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90 , top: 15),
                                child: Text(
                                    products[0].title,
                                    style: TextStyle(color: kTextColor)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90 , top: 40),
                                child: Text(
                                  '₹${products[0].price}',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90 , top: 70),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Quantity:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 200 , top: 70),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Amount:',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: kTextLightColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: Text(
                                        '₹ 1999.99',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          //height: 400,
                          width: 400,
                          padding: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: kTextLightColor,
                                style: BorderStyle.solid,
                                width: 0.7,
                              ),
                              color: Colors.white
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 10),
                                child: Text(
                                  'Delivery  Address',
                                  style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Column(
                                  children: <Widget>[
                                    RadioListTile(
                                      title: Text(
                                          'Current Address'
                                      ),
                                      value: 1,
                                      groupValue: selectedRadio2,
                                      activeColor: Colors.blueAccent,
                                      //selected: true,
                                      onChanged: (val){
                                        setSelectedRadio2(val);
                                        curDisappear();
                                      },
                                    ),
                                    RadioListTile(
                                      title: Text(
                                          'Different Address'
                                      ),
                                      value: 2,
                                      groupValue: selectedRadio2,
                                      activeColor: Colors.blueAccent,
                                      selected: false,
                                      onChanged: (val){
                                        setSelectedRadio2(val);
                                        difDisappear();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Offstage(
                                offstage: difAddress,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 170, left: 10),
                                  child: Container(
                                    width: 350,
                                    //height: 450,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kTextLightColor,
                                            style: BorderStyle.solid,
                                            width: 1
                                        ),
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20, top: 10),
                                          child: Text(
                                            'Enter  Address',
                                            style: TextStyle(
                                                color: kTextColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 50, right: 10),
                                          child: Container(
                                            height: 45,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Full Name *',
                                                labelStyle: TextStyle(
                                                    color: kTextLightColor,
                                                    fontSize: 20
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 110, right: 10),
                                          child: Container(
                                            height: 45,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Address Line 1 *',
                                                labelStyle: TextStyle(
                                                    color: kTextLightColor,
                                                    fontSize: 20
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 170, right: 10),
                                          child: Container(
                                            height: 45,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Address Line 2',
                                                labelStyle: TextStyle(
                                                    color: kTextLightColor,
                                                    fontSize: 20
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 230, right: 10),
                                          child: Container(
                                            height: 45,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Pin Code *',
                                                labelStyle: TextStyle(
                                                    color: kTextLightColor,
                                                    fontSize: 20
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 290, right: 10, bottom: 20),
                                          child: Container(
                                            height: 45,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Phone Number *',
                                                labelStyle: TextStyle(
                                                    color: kTextLightColor,
                                                    fontSize: 20
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Offstage(
                                offstage: curAddress,
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.only(left: 100, top: 180),
                                        child: Text(
                                            'Amadou Tidiane Ly',
                                            style: TextStyle(
                                                color: kTextLightColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16
                                            ),
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 100, top: 210),
                                      child: Text(
                                        '+91 636 0741 857',
                                        style: TextStyle(
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 100, top: 250),
                                      child: Text(
                                        'Gunjur  Palya,  1st Cross',
                                        style: TextStyle(
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 100, top: 280),
                                      child: Text(
                                        'Building No 26',
                                        style: TextStyle(
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 100, top: 310),
                                      child: Text(
                                        'Bangalore,  560087',
                                        style: TextStyle(
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 100, top: 340),
                                      child: Text(
                                        'India',
                                        style: TextStyle(
                                            color: kTextLightColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                        child: Container(
                          width: 400,
                          height: 180,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: kTextLightColor,
                                  style: BorderStyle.solid,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Offstage(
                            offstage: false,
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    'Order Details',
                                    style: TextStyle(
                                        color: kTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 50),
                                  child: Text(
                                    'Cart  Total',
                                    style: TextStyle(
                                        color: kTextLightColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 80),
                                  child: Text(
                                    'Delivery :',
                                    style: TextStyle(
                                        color: kTextLightColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 300, top: 50),
                                  child: Text(
                                    '₹  2549',
                                    style: TextStyle(
                                        color: kTextLightColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 300, top: 80),
                                  child: Text(
                                    '₹  99',
                                    style: TextStyle(
                                        color: kTextLightColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 140),
                                  child: Text(
                                    'Order Total',
                                    style: TextStyle(
                                        color: kTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 280, top: 140),
                                  child: Text(
                                    '₹  2648',
                                    style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                        child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: kTextLightColor,
                                  style: BorderStyle.solid,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    'Payment Method',
                                    style: TextStyle(
                                        color: kTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 50),
                                  child: Column(
                                    children: <Widget>[
                                      RadioListTile(
                                        title: Text(
                                          'Debit / Credit  Card'
                                        ),
                                        value: 1,
                                        groupValue: selectedRadio,
                                        activeColor: Colors.blueAccent,
                                        //selected: true,
                                        onChanged: (val){
                                          setSelectedRadio(val);
                                          disappear();
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                            'Cash On Delivery'
                                        ),
                                        value: 2,
                                        groupValue: selectedRadio,
                                        activeColor: Colors.blueAccent,
                                        selected: false,
                                        onChanged: (val){
                                          setSelectedRadio(val);
                                          disappear2();
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text(
                                            'Paytm'
                                        ),
                                        value: 3,
                                        groupValue: selectedRadio,
                                        activeColor: Colors.blueAccent,
                                        selected: false,
                                        onChanged: (val){
                                          setSelectedRadio(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top: 230, bottom: 20),
                                  child: Offstage(
                                    offstage: visible,
                                    child: Container(
                                      width: 400,
                                      height: 400,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: kTextLightColor,
                                              style: BorderStyle.solid,
                                              width: 1
                                          ),
                                          borderRadius: BorderRadius.circular(16)
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20, top: 10),
                                            child: Text(
                                              'Card Details',
                                              style: TextStyle(
                                                  color: kTextColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 40, right: 10),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Name on Card',
                                                labelStyle: TextStyle(
                                                    color: kTextLightColor,
                                                    fontSize: 20
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 115, right: 10),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Card Number',
                                                labelStyle: TextStyle(
                                                    color: kTextLightColor,
                                                    fontSize: 20
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20, top: 220),
                                            child: Text(
                                              'Expirity  Date',
                                              style: TextStyle(
                                                  color: kTextColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 215, top: 220),
                                            child: Text(
                                              'CVV',
                                              style: TextStyle(
                                                  color: kTextColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, top: 250, right: 10),
                                            child: Container(
                                              height: 45,
                                              width: 150,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'MM / YY',
                                                  labelStyle: TextStyle(
                                                      color: kTextLightColor,
                                                      fontSize: 20
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    borderSide: BorderSide(
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 210, top: 250, right: 10),
                                            child: Container(
                                              height: 45,
                                              width: 150,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  suffixIcon: Icon(Icons.credit_card),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    borderSide: BorderSide(
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 40, top: 340, right: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.lock,
                                                  color: Colors.blueAccent,
                                                  size: 40,
                                                ),
                                                Text(
                                                  '   Secure Payment',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    //fontWeight: FontWeight.bold,
                                                    //color: kTextLightColor
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Container(
                          height: 80,
                          width: 500,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            border: Border.all(
                                width: 1,
                                color: Colors.black12
                            ),
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: <Widget>[
                              Center(
                                //padding: const EdgeInsets.only(top: 15.0, left: 15),
                                child: SizedBox(
                                  height: 50,
                                  width: 350,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.transparent)
                                    ),
                                    color: Colors.blueAccent,
                                    textColor: Colors.white,
                                    child: Text(
                                      'Place Order',
                                      style: TextStyle(
                                          wordSpacing: 5,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    onPressed: (){},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 130.0),
          child: Center(
            child: Text(
              'Checkout',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),
          ),
        )
      ],
      elevation: 500,
    );
  }
}
