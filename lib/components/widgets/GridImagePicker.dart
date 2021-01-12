import 'dart:io';
import 'package:flutter/material.dart';
import 'package:paws/providers/FormImages.dart';
import 'package:provider/provider.dart';

class GridImgPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Images>(
      create: (context) => Images(),
      child: Consumer<Images>(
        builder: (context, images, child) {
          var items = images.items.map((e) => ImgBox(e)).toList();
          List<Widget> elements = [...items];
          if (items.length < 6) {
            elements.add(AddImgButton());
          }
          return GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: elements,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
          );
        },
      ),
    );
  }
}

class AddImgButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: IconButton(
          icon: Icon(Icons.add_a_photo_outlined),
          onPressed: () {
            var images = Provider.of<Images>(context, listen: false);
            images.add();
          },
        ),
      ),
    );
  }
}

class ImgBox extends StatelessWidget {
  final File file;

  ImgBox(this.file);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.file(
          file,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
