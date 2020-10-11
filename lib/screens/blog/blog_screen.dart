import 'package:fitforeverapp/screens/blog/blog_details_screen.dart';
import 'package:fitforeverapp/screens/blog/create_blog.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (
                    BuildContext context
                    )=> CreateBlog()
            )
        );
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: Colors.blueAccent ,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (
                                  BuildContext context
                                  )=> BlogDetailScreen()
                          )
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Container(
                              padding: EdgeInsets.all(0),
                              height: 320,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: kTextLightColor,
                                          style: BorderStyle.solid,
                                          width: 0.7,
                                        ),
                                      color: Colors.white
                                    ),
                                    child: Image.asset("assets/images/20200723_154130.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0 , top: 10, right: 170),
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
                                    padding: const EdgeInsets.only(left: 0 , top: 2, right: 215),
                                    child: Text(
                                        'Jul 15, 2020',
                                        style: TextStyle(
                                            color: kTextLightColor,
                                            fontSize: 16
                                        )
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 35, top: 2, right: 0),
                                        child: Text(
                                            'By :',
                                            style: TextStyle(
                                                color: kTextLightColor,
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
                                ],
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, bottom: 20),
                          child: Container(
                              padding: EdgeInsets.all(0),
                              height: 320,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: kTextLightColor,
                                          style: BorderStyle.solid,
                                          width: 0.7,
                                        ),
                                        color: Colors.white
                                    ),
                                    child: Image.asset("assets/images/20200723_154130.jpg"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0 , top: 10, right: 170),
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
                                    padding: const EdgeInsets.only(left: 0 , top: 2, right: 215),
                                    child: Text(
                                        'Jul 15, 2020',
                                        style: TextStyle(
                                            color: kTextLightColor,
                                            fontSize: 16
                                        )
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 35, top: 2, right: 0),
                                        child: Text(
                                            'By :',
                                            style: TextStyle(
                                                color: kTextLightColor,
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
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      actions: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 260.0),
            child: Text(
              'Blog',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: IconButton(
            icon: Icon(Icons.search, color: Colors.black, size: 30),
            onPressed: (){},
          ),
        )
      ],
    );
  }
}
