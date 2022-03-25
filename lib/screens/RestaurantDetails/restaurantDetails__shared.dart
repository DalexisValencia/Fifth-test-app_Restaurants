import 'package:restaurants/widgets/shared/shared__circle.dart';
import 'package:flutter/material.dart';

class RestaurantDetailsShared extends StatefulWidget {
  @override
  _RestaurantDetailsSharedState createState() =>
      _RestaurantDetailsSharedState();
}

class _RestaurantDetailsSharedState extends State<RestaurantDetailsShared> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
        vertical: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SharedCircle(
            icon: Icons.share,
            title: 'Share',
          ),
          SharedCircle(
            icon: Icons.comment,
            title: 'Comment',
          ),
          SharedCircle(
            icon: Icons.calendar_today,
            title: 'Schedule',
          ),
          SharedCircle(
            icon: Icons.assignment,
            title: 'Rerserve',
          )
        ],
      ),
    );
  }
}
