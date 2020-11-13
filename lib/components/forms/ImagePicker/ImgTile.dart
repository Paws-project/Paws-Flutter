import 'dart:io';

import "package:image_picker/image_picker.dart";
import 'package:flutter/material.dart';

class ImgTile extends StatefulWidget {
  final picker = ImagePicker();
  final List<File> images;

  ImgTile({this.images});

  @override
  _ImgTileState createState() => _ImgTileState();
}

class _ImgTileState extends State<ImgTile> {
  File chosenImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.amber[200],
          borderRadius: BorderRadius.circular(5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: (chosenImage != null)
              ? Image.file(
                  chosenImage,
                  fit: BoxFit.cover,
                )
              : IconButton(
                  icon: Icon(Icons.add_a_photo_outlined),
                  onPressed: getImage,
                ),
        ));
  }

  Future getImage() async {
    final pickedFile =
        await widget.picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      widget.images.add(File(pickedFile.path));
      setState(() {
        chosenImage = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }
}
