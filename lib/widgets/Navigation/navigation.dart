import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/sections/AppBarCustom.dart';
import 'package:fith_app__restaurant/widgets/Navigation/components/navigation__favoriteButton.dart';
import 'package:fith_app__restaurant/widgets/Navigation/components/navigation__goBackButton.dart';
import 'package:fith_app__restaurant/widgets/Navigation/components/navigation__trashButton.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final String secondItem;
  final int amout;
  final Function onPressed;
  Navigation({
    this.secondItem,
    this.amout,
    this.onPressed,
  });
  Widget _secondaryItem() {
    switch (secondItem) {
      case 'favorite':
        return FavoriteButton();
        break;
      case 'trash':
        return TrashButton(
          amout: amout,
          onClick: onPressed,
        );
        break;
      default:
    }
    return SizedBox();
  }

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
        iconRigth: _secondaryItem(),
      ),
    );
  }
}
