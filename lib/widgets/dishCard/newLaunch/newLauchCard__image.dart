import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Dishes.dart';

class NewLauchCardImage extends StatelessWidget {
  final Dishes? dish;
  const NewLauchCardImage({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            dish!.image!,
          ),
        ),
      ),
    );
  }
}
