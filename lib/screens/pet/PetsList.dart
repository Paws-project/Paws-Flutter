import 'package:flutter/material.dart';
import 'package:paws/providers/Pets.dart';
import 'package:provider/provider.dart';

class PetsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<Pets>(builder: (context, pets, child) {
        pets.all();
        var items = pets.items;
        return GridView.builder(
          itemCount: items.length,
          // itemCount: 2,
          itemBuilder: (context, i) {
            // var pet = items[i];
            return PetGridTile();
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.56),
        );
      }),
    );
  }
}

class PetGridTile extends StatelessWidget {
  final String imageSrc =
      "https://c.files.bbci.co.uk/12A9B/production/_111434467_gettyimages-1143489763.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                imageSrc,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
