import 'package:restaurants/interfaces/Dishes.dart';
import 'package:flutter/material.dart';
import 'package:restaurants/widgets/dishCard/car/cardCar__body.dart';
import 'package:restaurants/widgets/dishCard/car/cardCar__modifiers.dart';

//Componente utilizado para armar la tarjeta de carrito cuando tiene modificadores
class CardCar extends StatelessWidget {
  final Dishes? dish;
  final bool? selected;
  CardCar({
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
          CardCarBody(
            dish: dish,
            selected: selected,
            priceByCard: (amout) {},
          ),
          dish!.additions!.length >= 1
              ? CardCarModifiers(
                  additionals: dish!.additions,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
