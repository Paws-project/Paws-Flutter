import 'dart:io';

import 'package:flutter/material.dart';

import 'package:date_field/date_field.dart';

import 'package:paws/components/forms/ImagePicker/GridImagePicker.dart';
import 'package:paws/components/forms/PetDropDownButton.dart';
import 'package:paws/components/forms/PrimaryButton.dart';
import 'package:paws/components/forms/PetTextField.dart';
import 'package:paws/models/Pet.dart';
import 'package:paws/providers/PetProvider.dart';

class AddPetScreen extends StatefulWidget {
  static final routeName = "/addPet";

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  List<File> photos = [];
  // TODO: get from API possible petValue types
  String petTypeValue = "Dog";
  String sex = "Male";
  var nicknameController = TextEditingController();
  var dateController = TextEditingController();
  DateTime birthDate;
  var chipNumberController = TextEditingController();
  DateTime chipImplantationDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add pet"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
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
                    GridImgPicker(
                      images: photos,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
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
                    PetDropDownButton(
                      items: ["Dog", "Cat"],
                      onChanged: (String value) {
                        petTypeValue = value;
                      },
                    ),
                    PetDropDownButton(
                      items: ["Male", "Female"],
                      onChanged: (String value) {
                        sex = value;
                      },
                    ),
                    PetTextField(
                      label: "Nickname:",
                      controller: nicknameController,
                      keyboard: TextInputType.emailAddress,
                    ),
                    DateTimeFormField(
                      firstDate: DateTime.utc(1990),
                      lastDate: DateTime.now(),
                      onDateSelected: (DateTime time) {
                        this.birthDate = time;
                      },
                    ),
                    PetTextField(
                      label: "Chip Number:",
                      controller: chipNumberController,
                      keyboard: TextInputType.number,
                    ),
                    DateTimeFormField(
                      firstDate: DateTime.utc(1990),
                      lastDate: DateTime.now(),
                      onDateSelected: (DateTime time) {
                        this.chipImplantationDate = time;
                      },
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                text: "Add",
                onPressed: () async {
                  try {
                    PetProvider.save(Pet(
                      petType: petTypeValue,
                      sex: sex,
                      nickname: nicknameController.text,
                      birthDate: birthDate,
                      chipNumber: int.parse(chipNumberController.text),
                      chipImplantationDate: chipImplantationDate,
                    ));
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
