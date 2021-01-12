import 'package:flutter/material.dart';

class GoogleAuth extends StatelessWidget {
  final void Function() onPressed;

  GoogleAuth({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icons/G_logo.png",
            width: 25,
          ),
          SizedBox(width: 10.0),
          Text("Continue with Google"),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
