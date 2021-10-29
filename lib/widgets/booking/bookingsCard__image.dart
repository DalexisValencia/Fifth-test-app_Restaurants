import 'package:flutter/material.dart';
import 'package:restaurants/constants/contansts.dart';

class BookingsCardImage extends StatelessWidget {
  const BookingsCardImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.30,
      height: MediaQuery.of(context).size.width * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          borderRadiusImages,
        ),
        color: Colors.black,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            'assets/banner/fast-food.png',
          ),
        ),
      ),
    );
  }
}
