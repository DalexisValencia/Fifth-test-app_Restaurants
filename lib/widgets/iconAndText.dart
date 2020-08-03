import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final String text;
  final Color textColor;
  final double textSize;
  IconAndText(
      {this.icon,
      this.iconColor,
      this.iconSize,
      this.text,
      this.textColor,
      this.textSize});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        SizedBox(
          width: 2,
        ),
        Text(text,
            style: Theme.of(context).textTheme.caption.copyWith(
                color: textColor,
                fontWeight: FontWeight.w800,
                fontSize: textSize))
      ],
    );
  }
}
