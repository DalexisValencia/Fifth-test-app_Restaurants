import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title, subtitle;
  ScreenTitle({Key key, this.title, this.subtitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * defaultPadding,
          horizontal: MediaQuery.of(context).size.width * defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline4.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w600),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w300,
                ),
          )
        ],
      ),
    );
  }
}
