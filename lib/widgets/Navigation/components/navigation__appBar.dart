import 'package:restaurants/constants/contansts.dart';
// import 'package:restaurants/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  final Widget? iconLeft;
  final Widget? iconRigth;
  AppBarCustom({
    this.iconLeft,
    this.iconRigth,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * defaultPadding),
      width: MediaQuery.of(context).size.width,
      height: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconLeft!,
          iconRigth!,
        ],
      ),
    );
  }
}
