import 'package:flutter/material.dart';
import 'package:myfood_app/screens/homepage.dart';
import 'package:myfood_app/widget/mybutton.dart';

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 250,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Theme.of(context).accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Text(
                "Total",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "\$50",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            MyButton(
              name: "Order",
              onPressed: () {},
            ),
          ],
        ),
      ),
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
          "Check Out",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 70,
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/chickenbrost.png"),
                    ),
                    title: Row(
                      children: [
                        Text("x1"),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chicken Brost",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Star Hotel ",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "\$50",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 70,
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/chickenbrost.png"),
                    ),
                    title: Row(
                      children: [
                        Text("x1"),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chicken Brost",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Star Hotel ",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "\$50",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
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
}
