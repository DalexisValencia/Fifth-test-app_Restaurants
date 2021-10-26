import 'package:flutter/material.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';

class PromotionalCardLabelsPrices extends StatelessWidget {
  final Dishes? dish;
  const PromotionalCardLabelsPrices({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dish!.promotionLabel!.active == true
        ? Builder(builder: (BuildContext context) {
            List<Widget> _shipPrices = [];
            dish!.promotionLabel!.pricePromotions!
                .asMap()
                .entries
                .map(
                  (item) => {
                    _shipPrices.add(
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child: Chip(
                            backgroundColor: item.key == 0
                                ? Theme.of(context).buttonColor
                                : Theme.of(context).accentColor,
                            label: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${item.value.amount}-\$${formatterPrice(item.value.price)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  },
                )
                .toList();
            return Row(
              children: _shipPrices,
            );
          })
        : SizedBox();
  }
}
