import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Dishes.dart';

class NearYouCardRate extends StatelessWidget {
  final Dishes? dish;
  const NearYouCardRate({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 3,
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Theme.of(context).primaryColorLight,
                  size: 11,
                ),
                Text(
                  dish!.rating.toString(),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        color: Theme.of(context).primaryColorLight,
                      ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
