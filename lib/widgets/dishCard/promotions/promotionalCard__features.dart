import 'package:flutter/material.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/Card__CustomChip.dart';
import 'package:restaurants/widgets/dishCard/promotions/promotionalCard__labelsPrices.dart';
import 'package:restaurants/widgets/dishCard/promotions/promotionalCard__rating.dart';

class PromotionCardFeatures extends StatelessWidget {
  final Dishes? dish;
  const PromotionCardFeatures({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.03,
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Theme.of(context).primaryColorLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomChip(
              text: "\$${formatterPrice(dish!.price)}",
              textColor: Theme.of(context).primaryColor,
              textSize: 12,
              icon: Icons.monetization_on,
              iconColor: Theme.of(context).primaryColor,
              iconSize: 14,
            ),
            SizedBox(height: 5),
            Text(
              dish!.name!,
              style: Theme.of(context).textTheme.button!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 5),
            PromotionCardRating(
              dish: dish!,
            ),
            SizedBox(height: 7),
            CustomChip(
              text: "Preparation: ${dish!.preparation}",
              textColor: Theme.of(context).primaryColor,
              textSize: 12,
              icon: Icons.access_time,
              iconColor: Theme.of(context).primaryColor,
              iconSize: 14,
            ),
            SizedBox(height: 5),
            PromotionalCardLabelsPrices(
              dish: dish!,
            ),
          ],
        ),
      ),
    );
  }
}
