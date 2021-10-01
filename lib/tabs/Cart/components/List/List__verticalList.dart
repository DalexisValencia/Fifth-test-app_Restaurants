import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/tabs/Cart/components/List/List__Item.dart';
import 'package:flutter/material.dart';

class CartVerticalList extends StatelessWidget {
  final List<Dishes>? cartDishes;
  final Function? onSelectThis;
  final List<int>? selecteds;
  CartVerticalList({
    this.cartDishes,
    this.onSelectThis,
    this.selecteds,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> itemsCard = [];
          cartDishes!.asMap().entries.map((item) {
            itemsCard.add(
              GestureDetector(
                onLongPress: () {
                  onSelectThis!(item.key);
                },
                child: CompleteCartItem(
                  dish: cartDishes![item.key],
                  selected: selecteds!.contains(item.key),
                ),
              ),
            );
          }).toList();
          return Column(
            children: itemsCard,
          );
        },
      ),
    );
  }
}
