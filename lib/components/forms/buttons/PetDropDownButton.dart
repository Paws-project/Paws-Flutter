import 'package:flutter/material.dart';

class PetDropDownButton extends StatefulWidget {
  final List<String> items;
  final void Function(String) onChanged;

  PetDropDownButton({this.items, this.onChanged});

  @override
  _PetDropDownButtonState createState() => _PetDropDownButtonState();
}

class _PetDropDownButtonState extends State<PetDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: widget.items
          .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: widget.onChanged,
    );
  }
}
