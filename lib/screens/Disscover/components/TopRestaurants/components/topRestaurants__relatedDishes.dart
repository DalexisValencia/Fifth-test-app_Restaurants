import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/dishCard/normal/dishCard.dart';
import 'package:flutter/material.dart';

class RelatedDishesTopRestaurant extends StatelessWidget {
  final List<Dishes>? menu;
  RelatedDishesTopRestaurant({
    this.menu,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.07,
        top: MediaQuery.of(context).size.width * 0.02,
        left: MediaQuery.of(context).size.width * defaultPadding,
      ),
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> nextTops = [];
          menu!.map((e) {
            nextTops.add(
              DishCard(
                dish: e,
              ),
            );
          }).toList();
          return Column(
            children: nextTops,
          );
        },
      ),
    );
  }
}
