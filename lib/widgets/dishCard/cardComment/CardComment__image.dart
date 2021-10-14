import 'package:flutter/material.dart';

class CardCommentImage extends StatelessWidget {
  final String? image;
  const CardCommentImage({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(image!),
        ),
      ),
      width: totalWidth * 0.30,
      height: totalWidth * 0.30,
    );
  }
}
