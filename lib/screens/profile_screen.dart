import 'package:flutter/material.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/widget/mybutton.dart';

class ProfileScreen extends StatelessWidget {
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
            child: Text(
              "Edit",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w900,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSingleContainer(name: "Sabir Bugti"),
                        _buildSingleContainer(name: "Sabirbugti@gmail.com"),
                        _buildSingleContainer(name: "12345678910"),
                        _buildSingleContainer(name: "Male"),
                        _buildSingleContainer(name: "Balochistan,Pakistan"),
                        MyButton(
                          name: "Update",
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 180,
              left: 250,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 20,
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
