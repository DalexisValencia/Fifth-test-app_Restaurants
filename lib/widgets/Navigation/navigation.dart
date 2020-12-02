import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/sections/AppBarCustom.dart';
import 'package:fith_app__restaurant/widgets/Navigation/components/navigation__favoriteButton.dart';
import 'package:fith_app__restaurant/widgets/Navigation/components/navigation__goBackButton.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      width: MediaQuery.of(context).size.width,
      height: defaultHeaderCustomHeight,
      child: AppBarCustom(
        iconLeft: GoBackButton(),
        iconRigth: FavoriteButton(),
      ),
    );
  }
}
