import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String name;
  final Color nameColor;
  final IconData icon;
  final Color iconColor;
  CustomChip({this.name, this.nameColor, this.icon, this.iconColor});
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(right: totalWidth * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 1),
              child: Icon(icon, size: 13, color: iconColor),
            ),
            SizedBox(width: totalWidth * 0.005),
            Text(
              this.name,
              style: Theme.of(context).textTheme.caption.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.5,
                  color: nameColor),
            ),
          ],
        ));
  }
}
