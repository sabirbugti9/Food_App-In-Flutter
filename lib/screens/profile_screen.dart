import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/widget/mybutton.dart';
import 'package:myfood_app/widget/mypasswordtextformfield.dart';
import 'package:myfood_app/widget/mytextformfield.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEdit = false;
  bool isMale = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  File image;
  Future<void> getImage({ImageSource imageSource}) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  void vaildation() {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        fullName.text.isEmpty &&
        address.text.isEmpty &&
        phoneNumber.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("All Fleid Is Empty"),
        ),
      );
    } else if (fullName.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("FullName Is Empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Email Is Not Vaild"),
        ),
      );
    } else if (phoneNumber.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Phone Number Is Empty"),
        ),
      );
    } else if (phoneNumber.text.length < 11) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Phone Number Must Be 11 "),
        ),
      );
    } else if (password.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else if (password.text.length < 8) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Password Is Too Short"),
        ),
      );
    } else {}
  }

  Future<void> myDialogueBox() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      child: Builder(builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Camera"),
                  onTap: () {
                    getImage(
                      imageSource: ImageSource.camera,
                    );
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text("Gallery"),
                  onTap: () {
                    getImage(
                      imageSource: ImageSource.gallery,
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  Widget _buildAllTextFormField() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            controller: fullName,
            title: "FullName",
          ),
          MyTextFormField(
            controller: email,
            title: "Email",
          ),
          MyTextFormField(
            controller: phoneNumber,
            title: "Phone Number",
          ),
          MyTextFormField(
            controller: address,
            title: "Address",
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = !isMale;
              });
            },
            child: Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                isMale == false ? "Female" : "Male",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              decoration: BoxDecoration(
                  color: Color(0xfff5d8e4),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          MyPasswordTextFormField(
            controller: password,
            title: "Password",
          ),
          MyButton(
            name: "Update",
            onPressed: () {
              vaildation();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSingleContainer({String name}) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xfffeeaf4),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(left: 10),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => HomePage(),
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEdit = !isEdit;
                });
              },
              child: Text(
                isEdit == false ? "Edit" : "Close",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 75,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          maxRadius: 70,
                          backgroundImage:
                              AssetImage("images/profileimage.jpg"),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    color: Colors.white,
                    child: isEdit == false
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildSingleContainer(name: "Sabir Bugti"),
                              _buildSingleContainer(
                                  name: "Sabirbugti@gmail.com"),
                              _buildSingleContainer(name: "12345678910"),
                              _buildSingleContainer(name: "Male"),
                              _buildSingleContainer(
                                  name: "Balochistan,Pakistan"),
                            ],
                          )
                        : _buildAllTextFormField(),
                  ),
                ),
              ],
            ),
            isEdit != false
                ? Positioned(
                    top: 180,
                    left: 250,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 20,
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          myDialogueBox();
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
