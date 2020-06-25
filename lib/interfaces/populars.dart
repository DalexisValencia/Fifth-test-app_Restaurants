import 'package:flutter/rendering.dart';

class Popular {
  final String image;
  final String name;
  final String description;
  final String timePreparation;
  final String price;
  final String quality;
  final Color shipColor;
  final RelatedComment relatedComment;
    Popular(
      this.name,
      this.image,
      this.description,
      this.timePreparation,
      this.quality,
      this.price,
      this.relatedComment,
      this.shipColor
    );
}

class RelatedComment {
  final String name;
  final String img;
  final String comment;
  RelatedComment(this.name, this.img, this.comment);
}
