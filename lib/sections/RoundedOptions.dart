import 'package:fith_app__restaurant/sections/CircleOptionDetailRestaurant.dart';
import 'package:flutter/material.dart';

class RoundedOptionsContactWrapper extends StatefulWidget {
  @override
  _RoundedOptionsContactState createState() => _RoundedOptionsContactState();
}

class _RoundedOptionsContactState extends State<RoundedOptionsContactWrapper> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.02,
            right: MediaQuery.of(context).size.width * 0.02),
        // color: Colors.red,
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
        ));
  }
}
