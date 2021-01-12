import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Images with ChangeNotifier {
  final picker = ImagePicker();
  List<File> _items = [];

  List<File> get items {
    return [..._items];
  }

  Future add() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      this._items.add(File(pickedFile.path));
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }
}
