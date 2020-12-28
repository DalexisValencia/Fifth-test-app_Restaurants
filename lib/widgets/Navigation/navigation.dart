import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/widgets/Navigation/components/navigation__appBar.dart';
import 'package:fith_app__restaurant/widgets/Navigation/components/navigation__favoriteButton.dart';
import 'package:fith_app__restaurant/widgets/Navigation/components/navigation__goBackButton.dart';
import 'package:fith_app__restaurant/widgets/Navigation/components/navigation__searchButton.dart';
import 'package:fith_app__restaurant/widgets/Navigation/components/navigation__trashButton.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final String secondItem;
  final int amout;
  final Function onPressed;
  final String category;
  final Color iconColor;
  Navigation({
    this.secondItem,
    this.amout,
    this.onPressed,
    this.category,
    this.iconColor,
  });
  Widget _secondaryItem() {
    switch (secondItem) {
      case 'favorite':
        return FavoriteButton(
          iconColor: iconColor,
          onpressed: this.onPressed,
        );
        break;
      case 'trash':
        return TrashButton(
          amout: amout,
          onClick: onPressed,
          iconColor: iconColor,
        );
        break;
      case 'search':
        return SearchButton(
          category: category,
          iconColor: iconColor,
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
        iconLeft: GoBackButton(
          iconColor: iconColor,
        ),
        iconRigth: _secondaryItem(),
      ),
    );
  }
}
