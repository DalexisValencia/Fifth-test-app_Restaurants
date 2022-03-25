import 'package:flutter/material.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/Card__CustomChip.dart';

class CardCommentDetails extends StatelessWidget {
  final Dishes? dish;
  const CardCommentDetails({Key? key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          top: 4,
          right: 12,
        ),
        margin: EdgeInsets.only(
          left: totalWidth * 0.04,
        ),
        height: totalWidth * 0.30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomChip(
                  text: dish!.preparation,
                  textColor: Theme.of(context).primaryColor,
                  textSize: 12.5,
                  icon: Icons.timer,
                  iconColor: Theme.of(context).primaryColor,
                  iconSize: 13,
                ),
                CustomChip(
                  text: formatterPrice(dish!.price),
                  textColor: Theme.of(context).primaryColor,
                  textSize: 12.5,
                  icon: Icons.monetization_on,
                  iconColor: Theme.of(context).primaryColor,
                  iconSize: 13,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 1.8),
                    width: 30,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        dish!.rating.toString(),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColorLight,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 6),
            Text(
              dish!.name!,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColorDark,
                  ),
            ),
            SizedBox(height: 5),
            Text(
              dish!.details!.substring(0, 73) + '...',
              style: Theme.of(context).textTheme.overline!.copyWith(
                    letterSpacing: 0,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
