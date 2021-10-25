import 'package:flutter/material.dart';

class RestaurantCardSeeMore extends StatelessWidget {
  final Function? goRestaurantDetails;
  final bool? selected;
  const RestaurantCardSeeMore({
    Key? key,
    this.goRestaurantDetails,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      width: totalWidth,
      child: Align(
        alignment: Alignment.bottomRight,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () => goRestaurantDetails!(),
          color: selected!
              ? Theme.of(context).primaryColorLight
              : Theme.of(context).buttonColor,
          elevation: 0,
          child: Text(
            'See more',
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: selected!
                      ? Theme.of(context).buttonColor
                      : Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w500,
                ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
