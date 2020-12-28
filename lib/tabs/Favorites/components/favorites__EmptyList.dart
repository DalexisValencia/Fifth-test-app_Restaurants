import 'package:flutter/material.dart';

class EmptyFavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Container(
          child: Icon(
            Icons.star_outline_rounded,
            size: 40,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        SizedBox(height: 4),
        Container(
          // color: Colors.red,
          child: Text(
            'Your Favorite is empty',
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
