import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/widgets/Dish__card.dart';
import 'package:flutter/material.dart';

class RelatedDishesTopRestaurant extends StatelessWidget {
  final List<Dishes> menu;
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
          menu.map((e) {
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
