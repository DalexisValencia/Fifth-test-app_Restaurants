import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Dishes.dart';

class NearYouCardDescription extends StatelessWidget {
  final Dishes? dish;
  const NearYouCardDescription({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.6,
      padding: EdgeInsets.only(top: 6, left: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            dish!.name!,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w700,
                ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              dish!.details!.substring(1, 25) + '...',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    wordSpacing: 0.5,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
