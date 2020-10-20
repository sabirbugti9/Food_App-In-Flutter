import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Function onPressed;
  MyButton({this.name, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Theme.of(context).primaryColor,
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
