import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paws/components/forms/ImagePicker/ImgTile.dart';

class GridImgPicker extends StatefulWidget {
  final List<File> images;

  GridImgPicker({@required this.images});

  @override
  _GridImgPickerState createState() => _GridImgPickerState();
}

class _GridImgPickerState extends State<GridImgPicker> {
  List<ImgTile> elements;

  @override
  Widget build(BuildContext context) {
    // TODO: image indexing
    elements = [
      ImgTile(images: widget.images),
      ImgTile(images: widget.images),
      ImgTile(images: widget.images),
      ImgTile(images: widget.images),
      ImgTile(images: widget.images),
      ImgTile(images: widget.images),
    ];
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: elements,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
    );
  }

  void addElement() {
    setState(
      () => elements.add(ImgTile(
        images: widget.images,
      )),
    );
  }
}
