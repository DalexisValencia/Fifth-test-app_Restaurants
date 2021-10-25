import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/dishCard/card/Dish__card.dart';
import 'package:flutter/material.dart';

class FavoriteListCardDish extends StatelessWidget {
  final Dishes? dish;
  final bool? borderCustomColor;
  FavoriteListCardDish({
    this.dish,
    this.borderCustomColor,
  });
  @override
  Widget build(BuildContext context) {
    return DishCard(
      dish: dish!,
      borderCustomColor: borderCustomColor!,
    );
  }
}
