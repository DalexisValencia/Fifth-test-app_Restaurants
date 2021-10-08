import 'package:flutter/material.dart';

class TabsBottomNavItem extends StatelessWidget {
  final String? title;
  final IconData? icon;
  const TabsBottomNavItem({
    Key? key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      iconMargin: EdgeInsets.all(0),
      icon: Icon(
        icon,
        size: 20,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title!,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
