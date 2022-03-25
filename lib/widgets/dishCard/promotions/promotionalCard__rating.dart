import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Dishes.dart';

class PromotionCardRating extends StatelessWidget {
  final Dishes? dish;
  const PromotionCardRating({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Builder(
          builder: (BuildContext context) {
            List<Widget> starts = [];
            var obj = [1, 2, 3, 4, 5]; // Calificamos las 5 estrellas
            for (var prop in obj) {
              Color _startColor = Theme.of(context).accentColor;
              if (prop <= dish!.rating!.toInt()) {
                _startColor = Theme.of(context).buttonColor;
              }
              if (prop > dish!.rating!.toInt()) {
                _startColor = Theme.of(context).accentColor;
              }
              starts.add(
                Icon(
                  Icons.star,
                  color: _startColor,
                  size: 18,
                ),
              );
            }
            return Row(
              children: starts,
            );
          },
        ),
        SizedBox(
          width: 8,
        ),
        RichText(
          text: TextSpan(
            text: 'Average ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '${dish!.rating}%',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
