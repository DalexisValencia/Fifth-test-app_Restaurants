import 'package:flutter/material.dart';
import 'package:restaurants/constants/contansts.dart';

class CardCarImage extends StatelessWidget {
  final String? image;
  const CardCarImage({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusImages),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            image!,
          ),
        ),
      ),
    );
  }
}
