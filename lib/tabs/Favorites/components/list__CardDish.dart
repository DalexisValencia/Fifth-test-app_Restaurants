import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/widgets/Dish__card.dart';
import 'package:flutter/material.dart';

class FavoriteListCardDish extends StatelessWidget {
  final Dishes dish;
  final bool borderCustomColor;
  FavoriteListCardDish({
    this.dish,
    this.borderCustomColor,
  });
  @override
  Widget build(BuildContext context) {
    return DishCard(
      dish: dish,
      borderCustomColor: borderCustomColor,
    );
  }
}
