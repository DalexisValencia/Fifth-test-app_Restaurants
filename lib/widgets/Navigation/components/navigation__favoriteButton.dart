import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleIconButton(
      icon: Icons.favorite,
      color: Theme.of(context).primaryColorDark,
      bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
      trigger: () {
        print("añadirme a favoritos");
      },
    );
  }
}
