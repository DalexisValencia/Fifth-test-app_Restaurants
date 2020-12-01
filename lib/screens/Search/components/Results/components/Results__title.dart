import 'dart:ui';

import 'package:flutter/material.dart';

class ResultsTitle extends StatelessWidget {
  final String showing;
  final String total;
  ResultsTitle({
    this.showing,
    this.total,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 5),
      child: Align(
        alignment: Alignment.topRight,
        child: RichText(
          text: TextSpan(
            text: 'Show ',
            style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
            children: <TextSpan>[
              TextSpan(
                text: showing,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: ' of ',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: total,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
