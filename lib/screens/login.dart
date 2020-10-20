import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/screens/signup.dart';
import 'package:myfood_app/widget/haveaccountornot.dart';
import 'package:myfood_app/widget/mybutton.dart';
import 'package:myfood_app/widget/mypasswordtextformfield.dart';
import 'package:myfood_app/widget/mytextformfield.dart';
import 'package:myfood_app/widget/toptitle.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
   final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  bool isLoading = false;
  UserCredential authResult;
  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomePage(),
        ),
      );
    } on PlatformException catch (e) {
      String message = "Please Check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text(message.toString()),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );

      setState(() {
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  void vaildation() {
    if (email.text.isEmpty && password.text.isEmpty) {
      scaffold.currentState.showSnackBar(
        SnackBar(
          content: Text("Both Fleid Is Empty"),
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

 
  final TextEditingController password = TextEditingController();

  Widget _buildAllTextFormFiledPlace() {
    return Center(
      child: Container(
        height: 300,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextFormField(
              title: "Email",
              controller: email,
            ),
            SizedBox(
              height: 10,
            ),
            MyPasswordTextFormField(
              controller: password,
              title: "Password",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonPart() {
    return isLoading == false
        ? MyButton(
            name: "Login",
            onPressed: () {
              vaildation();
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _buildHaveAccountNotPart() {
    return HaveAccountOrNot(
      subTitle: "Sign Up",
      title: "I Don't Have An Account?",
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => SignUp(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffold,
      backgroundColor: Color(0xfff8f8f8),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TopTitle(
                subsTitle: "Welcome Back!",
                title: "Login",
              ),
              _buildAllTextFormFiledPlace(),
              _buildButtonPart(),
              SizedBox(
                height: 10,
              ),
              _buildHaveAccountNotPart(),
            ],
          ),
        ),
      ),
    );
  }
}
