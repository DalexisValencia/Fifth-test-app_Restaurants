import 'package:fith_app__restaurant/interfaces/Comments.dart';
import 'package:fith_app__restaurant/interfaces/Ingredients.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
import 'package:flutter/material.dart';

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
  double finalPrice;

  Dishes({
    this.name,
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
    this.promotionLabel,
    this.finalPrice,
  });

  Dishes copyWith(dish) {
    return Dishes(
      name: dish.name,
      details: dish.details,
      image: dish.image,
      price: dish.price,
      rating: dish.rating,
      preparation: dish.preparation,
      comments: dish.comments,
      category: dish.category,
      additions: dish.additions,
      ingredients: dish.ingredients,
      amount: dish.amount,
      promotionLabel: dish.promotionLabel,
      finalPrice: dish.finalPrice,
    );
  }
}

class Promotions {
  Color color;
  String label;
  bool active;
  List<PricePromotions> pricePromotions;
  double discounts;
  Promotions({
    this.color,
    this.label,
    this.active,
    this.pricePromotions,
    this.discounts,
  });
}

class PricePromotions {
  int amount, price;
  PricePromotions({
    this.amount,
    this.price,
  });
}
