import 'package:flutter/material.dart';
import 'package:paws/screens/Auth.dart';
import 'package:paws/screens/AddPetScreen.dart';

class Main extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            FlatButton(
              child: SafeArea(child: Icon(Icons.add)),
              onPressed: () {
                Navigator.pushNamed(context, AddPetScreen.routeName);
              },
            ),
            FlatButton(
              child: SafeArea(child: Icon(Icons.app_registration)),
              onPressed: () {
                Navigator.pushNamed(context, SignUp.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
