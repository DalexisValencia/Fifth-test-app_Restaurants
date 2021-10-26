import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Dishes.dart';

class PromotionCardOffer extends StatelessWidget {
  final Dishes? dish;
  const PromotionCardOffer({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.03,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.01,
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.01,
            ),
            decoration: BoxDecoration(
              color: dish!.promotionLabel!.color,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              dish!.promotionLabel!.label!,
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 12,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
