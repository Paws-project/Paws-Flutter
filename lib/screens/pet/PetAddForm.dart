import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:paws/components/widgets/GridImagePicker.dart';
import 'package:paws/components/forms/buttons/PrimaryButton.dart';
import 'package:paws/models/Pet.dart';
import 'package:paws/providers/Pets.dart';
import 'package:provider/provider.dart';

class PetAddForm extends StatelessWidget {
  static final routeName = "/add_pet_form";

  @override
  Widget build(BuildContext context) {
    var pest = Provider.of<Pets>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add pet"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Image picker section
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.camera_alt_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Add images"),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    GridImgPicker(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Primary data section

              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Primary data"),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    DropdownButtonFormField(
                      hint: Text("Type"),
                      items: ["Dog", "Cat"]
                          .map<DropdownMenuItem<String>>(
                              (e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                          .toList(),
                      onChanged: (data) {},
                    ),
                    DropdownButtonFormField(
                      hint: Text("Sex"),
                      items: ["Male", "Female"]
                          .map<DropdownMenuItem<String>>(
                              (e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                          .toList(),
                      onChanged: (data) {},
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(hintText: "Nickname"),
                    ),
                    DateTimeFormField(
                      firstDate: DateTime.utc(1990),
                      lastDate: DateTime.now(),
                      onDateSelected: (DateTime time) {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Optional data section
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Optional data"),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Chip number"),
                    ),
                    DateTimeFormField(
                      firstDate: DateTime.utc(1990),
                      lastDate: DateTime.now(),
                      onDateSelected: (DateTime time) {},
                    ),
                  ],
                ),
              ),
              Consumer<Pets>(
                builder: (context, value, child) => PrimaryButton(
                    text: "Add",
                    onPressed: () {
                      pest.add(
                        Pet(
                          type: "dog",
                          male: true,
                          nickname: "testaddition",
                          // birthDate: DateTime(2005),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
