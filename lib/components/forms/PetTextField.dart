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

//! Deprecated
// class PetTextField extends StatefulWidget {
//   final String label;
//   final TextEditingController controller;
//   final TextInputType keyboard;

//   PetTextField({this.label, this.controller, this.keyboard});

//   @override
//   _PetTextFieldState createState() => _PetTextFieldState();
// }

// class _PetTextFieldState extends State<PetTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: (widget.keyboard == TextInputType.visiblePassword),
//       keyboardType: widget.keyboard,
//       controller: widget.controller,
//       decoration: InputDecoration(
//         labelText: widget.label,
//       ),
//       onTap: () {},
//     );
//   }
// }
