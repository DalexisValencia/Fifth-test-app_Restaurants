import 'package:flutter/material.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/Card__CustomChip.dart';

class CardCarFeatures extends StatelessWidget {
  final Dishes? dish;
  const CardCarFeatures({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.width * 0.25,
        margin: EdgeInsets.only(left: 5, right: 5),
        padding: EdgeInsets.fromLTRB(5, 6, 5, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                CustomChip(
                  text: this.dish!.preparation!,
                  textColor: Theme.of(context).primaryColor,
                  textSize: 12.5,
                  icon: Icons.timer,
                  iconColor: Theme.of(context).primaryColor,
                  iconSize: 13,
                ),
                CustomChip(
                  text: formatterPrice(this.dish!.price!),
                  textColor: Theme.of(context).buttonColor,
                  textSize: 12.5,
                  icon: Icons.monetization_on,
                  iconColor: Theme.of(context).buttonColor,
                  iconSize: 13,
                ),
              ],
            ),
            Text(
              this.dish!.name!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
            ),
            Text(
              this.dish!.details!.length > 55
                  ? this.dish!.details!.substring(0, 58) + " ... "
                  : this.dish!.details!,
              style: Theme.of(context).textTheme.overline!.copyWith(
                    letterSpacing: 0,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  "\$${formatterPrice(this.dish!.finalPrice)}",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).buttonColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(width: 10),
                Visibility(
                  visible: this.dish!.promotionLabel!.discounts! > 0,
                  child: Text(
                    "- \$${formatterPrice(this.dish!.promotionLabel!.discounts)}",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).primaryColorDark,
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
