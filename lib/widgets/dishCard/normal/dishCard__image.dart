import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Dishes.dart';

class DishCardImage extends StatelessWidget {
  final Dishes? dish;
  const DishCardImage({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
