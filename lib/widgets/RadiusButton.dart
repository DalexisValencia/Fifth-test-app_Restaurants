import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:flutter/material.dart';

class RoundedCustomButton extends StatefulWidget {
  final String title;
  final Function callPressed;
  RoundedCustomButton({this.title, this.callPressed});
  @override
  _RoundedCustomButtonState createState() => _RoundedCustomButtonState();
}

class _RoundedCustomButtonState extends State<RoundedCustomButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding: EdgeInsets.all(0),
        splashColor: Theme.of(context).buttonColor,
        height: 25,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius)),
        onPressed: () => widget.callPressed(),
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Theme.of(context).buttonColor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline),
        ));
  }
}
