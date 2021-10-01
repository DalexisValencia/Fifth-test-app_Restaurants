//Componente utilizado para armar la tarjeta de carrito cuando tiene modificadores
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/tabs/Cart/components/List/item/Item__card.dart';
import 'package:restaurants/tabs/Cart/components/List/item/Item__modifier.dart';
import 'package:flutter/material.dart';

class CompleteCartItem extends StatelessWidget {
  final Dishes? dish;
  final bool? selected;
  CompleteCartItem({
    Key? key,
    this.dish,
    this.selected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Column(
        children: [
          ItemCartCard(
            dish: dish,
            selected: selected,
            priceByCard: (amout) {
              //print("en esta vista::");
              //print(amout);
            },
          ),
          dish!.additions!.length >= 1
              ? ExpansionModifiersCartItem(
                  additionals: dish!.additions,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
