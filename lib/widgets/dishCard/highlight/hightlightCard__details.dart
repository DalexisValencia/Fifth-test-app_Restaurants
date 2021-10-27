import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Dishes.dart';

class HighlightCardDetails extends StatelessWidget {
  final Dishes? suggestion;
  const HighlightCardDetails({
    Key? key,
    this.suggestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            suggestion!.name!,
            style: Theme.of(context).textTheme.button!.copyWith(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.w800,
              shadows: [
                Shadow(
                  blurRadius: 3.0,
                  color: Colors.black,
                  offset: Offset(0, 0),
                )
              ],
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              suggestion!.details!.substring(0, 15) + '...',
              style: Theme.of(context).textTheme.caption!.copyWith(
                color: Theme.of(context).primaryColorLight,
                shadows: [
                  Shadow(
                    blurRadius: 3.0,
                    color: Colors.black,
                    offset: Offset(0, 0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
