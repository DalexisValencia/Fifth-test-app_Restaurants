import 'package:flutter/material.dart';

class HomeHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            "Have a Good day",
            style: Theme.of(context).textTheme.headline5.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorLight,
              shadows: [
                Shadow(
                  blurRadius: 15.0,
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            'Restaurants waiting for you',
            style: Theme.of(context).textTheme.subtitle2.copyWith(
              fontWeight: FontWeight.normal,
              color: Theme.of(context).primaryColorLight,
              shadows: [
                Shadow(
                  blurRadius: 15.0,
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
