import 'package:fitforeverapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  static const fb = "www.facebook.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 140, 20, 20),
              child: Text(
                'Whitefield Main Road \n Bangalore \n Karnataka \n India',
                style: TextStyle(
                  color: kTextLightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(215, 140, 10, 20),
              child: Text(
                '+91 6360753920 \n fitforever@gmail.com \n www.fitforever.com',
                style: TextStyle(
                    color: kTextLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(60, 250, 60, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: kTextColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        icon: SvgPicture.asset("assets/icons/fb.svg", color: Colors.white, height: 110,),
                        onPressed: _launchURL,

                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: kTextColor,
                    child: IconButton(
                        icon: SvgPicture.asset("assets/icons/instagram.svg", color: Colors.white, height: 100,)
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: kTextColor,
                    child: IconButton(
                        icon: SvgPicture.asset("assets/icons/whatsapp.svg", color: Colors.white, height: 120,)
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: kTextColor,
                    child: IconButton(
                        icon: SvgPicture.asset("assets/icons/twitter.svg", color: Colors.white, height: 100,)
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 340, 20, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: kTextLightColor)
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: Form(
                    //key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                          child: Text(
                            'Get In Touch',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.description),
                              labelText: 'SUBJECT',
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kTextLightColor,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueAccent)
                              )
                          ),
                          validator: (input)=> input.length==0 ? 'Can not be empty' : null,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 28.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.create),
                                labelText: 'MESSAGE',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextLightColor,
                                )
                            ),
                            validator: (input)=> input.length==0 ? 'Can not be empty' : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40, bottom: 30),
                          child: Container(
                            height: 50,
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kTextColor,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                      child: Text(
                                          'SEND',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,
                                          ),
                                        ),
                                    )
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(){
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 80),
        child: Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
  _launchURL() async {
    const url = 'https://facebook.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
