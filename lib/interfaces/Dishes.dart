import 'package:fith_app__restaurant/interfaces/Comments.dart';
import 'package:fith_app__restaurant/interfaces/Ingredients.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
// import 'package:fith_app__restaurant/interfaces/categories.dart';

class Dishes {
  final String name;
  final String details;
  final String image;
  final double price;
  final double rating;
  final String preparation;
  final List<Comments> comments;
  final List<String> category;
  final bool promotion;
  final List<PricePromotions>
      pricePromotions; // Por ahora solo tres precios por promocion
  final List<Adittional> additions;
  final List<Ingredients> ingredients;
  final int amount;

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
      this.pricePromotions,
      this.additions,
      this.ingredients,
      this.amount
      //
      });
}

class PricePromotions {
  final amount;
  final price;
  PricePromotions({this.amount, this.price});
}
