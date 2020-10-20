import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:myfood_app/screens/login.dart';
import 'package:myfood_app/widget/mybutton.dart';

class SkipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Carousel(
              animationDuration: Duration(seconds: 2),
              autoplay: true,
              boxFit: BoxFit.cover,
              dotBgColor: Colors.transparent,
              dotIncreasedColor: Theme.of(context).primaryColor,
              dotSize: 10,
              images: [
                AssetImage("images/imageslider1.jpg"),
                AssetImage("images/imageslider2.jpg"),
                AssetImage("images/imageslider3.jpg"),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MyButton(
                  name: "Skip",
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => Login(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
