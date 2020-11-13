import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboard;

  AuthTextField({this.label, this.controller, this.keyboard});

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (widget.keyboard == TextInputType.visiblePassword),
      keyboardType: widget.keyboard,
      focusNode: focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
      ),
      onTap: () {},
    );
  }
}
