import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  CustomChip({
    this.text,
    this.textColor,
    this.textSize,
    this.icon,
    this.iconColor,
    this.iconSize,
  });
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        right: totalWidth * 0.03,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 1,
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
          SizedBox(
            width: totalWidth * 0.005,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: textSize,
                  color: textColor,
                ),
          ),
        ],
      ),
    );
  }
}
