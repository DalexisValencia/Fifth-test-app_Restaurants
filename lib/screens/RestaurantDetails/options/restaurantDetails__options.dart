import 'package:restaurants/screens/RestaurantDetails/options/components/options__circle.dart';
import 'package:flutter/material.dart';

class RoundedOptionsContactWrapper extends StatefulWidget {
  @override
  _RoundedOptionsContactState createState() => _RoundedOptionsContactState();
}

class _RoundedOptionsContactState extends State<RoundedOptionsContactWrapper> {
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
          CircleOption(
            icon: Icons.share,
            title: 'Share',
          ),
          CircleOption(
            icon: Icons.comment,
            title: 'Comment',
          ),
          CircleOption(
            icon: Icons.calendar_today,
            title: 'Schedule',
          ),
          CircleOption(
            icon: Icons.assignment,
            title: 'Rerserve',
          )
        ],
      ),
    );
  }
}
