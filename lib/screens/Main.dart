import 'package:flutter/material.dart';
import 'package:paws/providers/Pets.dart';
import 'package:paws/screens/pet/PetsList.dart';
import 'package:paws/screens/pet/PetAddForm.dart';
import 'package:provider/provider.dart';

class Main extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PetsGrid(),
      floatingActionButton: Consumer<Pets>(
        builder: (context, pets, child) => FloatingActionButton(
          onPressed: () =>
              // Navigator.pushNamed(context, AddPetScreen.routeName),
              Navigator.pushNamed(context, PetAddForm.routeName),
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
