import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/widgets/Navigation/components/navigation__appBar.dart';
import 'package:restaurants/widgets/Navigation/components/navigation__favoriteButton.dart';
import 'package:restaurants/widgets/Navigation/components/navigation__goBackButton.dart';
import 'package:restaurants/widgets/Navigation/components/navigation__searchButton.dart';
import 'package:restaurants/widgets/Navigation/components/navigation__trashButton.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final String? secondItem;
  final int? amout;
  final Function? onPressed;
  final String? category;
  final Color? iconColor;
  final Color? goBackColor;
  final Function? goBack;
  Navigation({
    this.secondItem,
    this.amout,
    this.onPressed,
    this.category,
    this.iconColor,
    this.goBackColor = tertiaryColor,
    this.goBack,
  });
  Widget _secondaryItem() {
    switch (secondItem) {
      case 'favorite':
        return FavoriteButton(
          iconColor: iconColor,
          onpressed: this.onPressed,
        );
      case 'trash':
        return TrashButton(
          amout: amout,
          onClick: onPressed,
          iconColor: iconColor,
        );
      case 'search':
        return SearchButton(
          category: category,
          iconColor: iconColor,
        );
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
          iconColor: goBackColor,
          goBack: goBack,
        ),
        iconRigth: _secondaryItem(),
      ),
    );
  }
}
