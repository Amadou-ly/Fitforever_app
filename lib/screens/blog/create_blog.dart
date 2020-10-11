import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


import '../../constants.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  File imageFile;
  _openGallery() async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile = picture;
    });
  }
  Widget _view(){
    if(imageFile == null){
      //return Center(child: Text('No Image Selected'));
    }else{
      return Container(
        width: 300,
        decoration: BoxDecoration(
          //color: Colors.white,
          border: Border.all(color: kTextLightColor, width: 2),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.all(8),
        child: Image.file(
                imageFile, width: 290, height: 200),
      );
    }
  }
  Widget _button(){
    if(imageFile == null){
      return Text('Choose Image');
    }else{
      return Text('Change Image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
          child: Form(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
                    child: Text(
                      'Title',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                ),
                TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: kTextLightColor,
                          width: 2.0,
                        ),
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kTextLightColor,
                      )
                  ),
                  validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _view()
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: _button(),
                    onPressed: (){
                      _openGallery();
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 10),
                    child: Text(
                      'Description',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    )
                ),
                TextFormField(
                  maxLines: null,
                  expands: false,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: kTextLightColor,
                          width: 2.0,
                        ),
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kTextLightColor,
                      )
                  ),
                  validator: (input)=> input.length < 8  ? 'Enter at least 8 characters' : null,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.blue,
                      color: Colors.blueAccent,
                      child: GestureDetector(
                        onTap: (){
                        },
                        child: Center(
                          child: Text(
                            'Upload',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Create a Post',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}
