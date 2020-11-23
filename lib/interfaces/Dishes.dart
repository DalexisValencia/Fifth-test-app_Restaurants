import 'package:fith_app__restaurant/interfaces/Comments.dart';
import 'package:fith_app__restaurant/interfaces/Ingredients.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
import 'package:flutter/material.dart';
// import 'package:fith_app__restaurant/interfaces/categories.dart';

class Dishes {
  String name;
  String details;
  String image;
  double price;
  double rating;
  String preparation;
  List<Comments> comments;
  List<String> category;
  List<Adittional> additions;
  List<Ingredients> ingredients;
  int amount;
  Promotions promotionLabel;

  Dishes(
      {this.name,
      this.details,
      this.image,
      this.price,
      this.rating,
      this.preparation,
      this.comments,
      this.category,
      this.additions,
      this.ingredients,
      this.amount,
      this.promotionLabel
      //
      });
}

class Promotions {
  Color color;
  String label;
  bool active;
  List<PricePromotions> pricePromotions;
  Promotions({this.color, this.label, this.active, this.pricePromotions});
}

class PricePromotions {
  int amount, price;
  PricePromotions({this.amount, this.price});
}
