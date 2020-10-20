import 'package:flutter/material.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/widget/mybutton.dart';
import 'package:myfood_app/widget/mytextformfield.dart';

class Contact extends StatefulWidget {
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController message = TextEditingController();

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  void vaildation() {
    if (email.text.isEmpty && fullname.text.isEmpty && message.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("All Fleid Is Empty"),
        ),
      );
    } else if (fullname.text.isEmpty) {
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
    } else if (!Contact.regExp.hasMatch(email.text)) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Email Is Not Vaild"),
        ),
      );
    } else if (message.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Message Is Empty"),
        ),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffold,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
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
        backgroundColor: Colors.white,
        title: Text(
          "Contact",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTextFormField(
                      controller: fullname,
                      title: "Full Name",
                    ),
                    MyTextFormField(
                          controller: email,
                      title: "Email",
                    ),
                    MyTextFormField(
                          controller: message,
                      title: "Message",
                    ),
                    MyButton(
                      name: "Send",
                      onPressed: () {
                        vaildation();
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
