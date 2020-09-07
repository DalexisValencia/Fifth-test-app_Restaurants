import 'package:fith_app__restaurant/interfaces/Comments.dart';
import 'package:fith_app__restaurant/interfaces/categories.dart';

class Dishes {
  final String name;
  final String details;
  final String image;
  final double price;
  final double rating;
  final String preparation;
  final List<Comments> comments;
  final List<Category> category;
  final bool promotion;
  final List<double>
      pricePromotions; // Por ahora solo tres precios por promocion

  Dishes(
      {this.name,
      this.details,
      this.image,
      this.price,
      this.rating,
      this.preparation,
      this.comments,
      this.category,
      this.promotion,
      this.pricePromotions});
}