import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/screens/login.dart';
import 'package:myfood_app/widget/haveaccountornot.dart';
import 'package:myfood_app/widget/mybutton.dart';
import 'package:myfood_app/widget/mypasswordtextformfield.dart';
import 'package:myfood_app/widget/mytextformfield.dart';
import 'package:myfood_app/widget/toptitle.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isMale = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  bool isLoading = false;
  UserCredential authResult;
  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on PlatformException catch (e) {
      String message = "Please Check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(authResult.user.uid)
        .set({
      "UserName": fullName.text,
      "UserEmail": email.text,
      "UserId": authResult.user.uid,
      "UserNumber": phoneNumber.text,
      "UserAddress": address.text,
      "UserGender": isMale == true ? "Male" : "Female"
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => HomePage(),
      ),
    );
    setState(() {
      isLoading = false;
    });
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
    } else {
      submit();
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  Widget _buildAllTextFormField() {
    return Container(
      height: 400,
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
        ],
      ),
    );
  }

  Widget _buildButtonPart() {
    return isLoading == false
        ? MyButton(
            name: "Sign Up",
            onPressed: () {
              vaildation();
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _buildHaveAccountOrNotPart() {
    return HaveAccountOrNot(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => Login(),
          ),
        );
      },
      subTitle: "Login",
      title: "I Have Already An Account?",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopTitle(
                  title: "SignUp",
                  subsTitle: "Create an Account",
                ),
                _buildAllTextFormField(),
                _buildButtonPart(),
                _buildHaveAccountOrNotPart(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
