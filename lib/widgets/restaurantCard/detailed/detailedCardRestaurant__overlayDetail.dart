import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/widgets/Card__CustomChip.dart';

class DetailedCardRestaurantOverlayDetail extends StatelessWidget {
  final Restaurants? resturant;
  const DetailedCardRestaurantOverlayDetail({
    Key? key,
    this.resturant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.6),
                width: 0.6,
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.010,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            resturant!.name!,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            resturant!.description!.substring(0, 20) + "...",
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      fontSize: 10,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.restaurant,
                    size: 20,
                    color: Theme.of(context).primaryColorLight,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomChip(
                text: '${resturant!.rating} stars',
                textColor: Theme.of(context).primaryColorDark,
                textSize: 12,
                icon: Icons.star,
                iconColor: Theme.of(context).primaryColorDark,
                iconSize: 14,
              ),
              CustomChip(
                text: '${resturant!.distance}',
                textColor: Theme.of(context).primaryColorDark,
                textSize: 12,
                icon: Icons.location_on,
                iconColor: Theme.of(context).primaryColorDark,
                iconSize: 14,
              ),
              Material(
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () {},
                  child: CustomChip(
                    text: 'Reserve',
                    textColor: Theme.of(context).primaryColorDark,
                    textSize: 12,
                    icon: Icons.assignment,
                    iconColor: Theme.of(context).primaryColorDark,
                    iconSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
