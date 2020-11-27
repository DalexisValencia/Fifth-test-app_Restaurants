//Imagen principal del plato
import 'package:flutter/material.dart';

class DishPortrait extends StatelessWidget {
  final String image;
  DishPortrait({
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(image),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
    );
  }
}
