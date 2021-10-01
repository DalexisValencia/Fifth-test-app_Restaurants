import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/widgets/Button_roundWithIcon.dart';
import 'package:flutter/material.dart';

class FixedTopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: (MediaQuery.of(context).size.width * defaultPadding) - 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleIconButton(
            icon: Icons.menu,
            color: Theme.of(context).primaryColorLight,
            bgColor: Theme.of(context).primaryColor.withOpacity(0.5),
            trigger: () {},
          ),
          CircleIconButton(
            icon: Icons.favorite,
            color: Theme.of(context).primaryColorLight,
            bgColor: Theme.of(context).primaryColorLight.withOpacity(0.4),
            trigger: () {},
          ),
        ],
      ),
    );
  }
}
