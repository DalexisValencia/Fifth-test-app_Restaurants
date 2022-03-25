import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/widgets/Button_roundWithIcon.dart';

class RestaurantCardHeadline extends StatelessWidget {
  final bool? selected;
  final bool? favorite;
  final Restaurants? restaurant;
  const RestaurantCardHeadline({
    Key? key,
    this.selected,
    this.favorite,
    this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          width: totalWidth * 0.12,
          child: CircleIconButton(
            icon: Icons.store_mall_directory,
            color: selected! && favorite!
                ? Theme.of(context).primaryColorLight
                : Theme.of(context).primaryColorLight.withOpacity(0.9),
            bgColor: selected! && favorite!
                ? Theme.of(context).buttonColor
                : Theme.of(context).primaryColor.withOpacity(0.5),
            trigger: () {},
          ),
        ),
        Container(
          width: totalWidth * 0.50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  restaurant!.name!,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    shadows: [
                      Shadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 2.0,
                        color: Theme.of(context).primaryColorDark,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: totalHeight * 0.007,
              ),
              Text(
                restaurant!.description!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  shadows: [
                    Shadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 2.0,
                      color: Theme.of(context).primaryColorDark,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
