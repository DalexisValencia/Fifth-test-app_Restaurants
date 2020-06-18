class Popular {
  final String image;
  final String name;
  final String description;
  final String timePreparation;
  final String price;
  final RelatedComment relatedComment;
    Popular(
      this.name,
      this.image,
      this.description,
      this.timePreparation,
      this.price,
      this.relatedComment
    );
}

class RelatedComment {
  final String name;
  final String img;
  final String comment;
  RelatedComment(this.name, this.img, this.comment);
}
