import 'package:flutter/material.dart';

class PetTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboard;

  PetTextField({this.label, this.controller, this.keyboard});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (keyboard == TextInputType.visiblePassword),
      keyboardType: keyboard,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
