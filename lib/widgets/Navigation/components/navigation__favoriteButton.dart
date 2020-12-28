import 'package:fith_app__restaurant/widgets/Button_roundWithIcon.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final Color iconColor;
  final Function onpressed;
  FavoriteButton({
    this.iconColor,
    this.onpressed,
  });
  @override
  Widget build(BuildContext context) {
    return CircleIconButton(
      icon: Icons.favorite,
      color: iconColor == null ? Theme.of(context).primaryColorDark : iconColor,
      bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
      trigger: () => onpressed(),
    );
  }
}
