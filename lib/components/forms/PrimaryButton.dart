import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  PrimaryButton({this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: RaisedButton(
          color: Colors.amber[100],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Text(text),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
