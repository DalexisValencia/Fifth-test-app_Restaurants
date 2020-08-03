import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;
  IconAndText({this.icon, this.iconColor, this.text, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          size: 16,
        ),
        SizedBox(
          width: 2,
        ),
        Text(text,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: textColor, fontWeight: FontWeight.w800))
      ],
    );
  }
}
