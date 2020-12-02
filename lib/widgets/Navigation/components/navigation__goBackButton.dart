import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: CircleIconButton(
        icon: Icons.arrow_back,
        color: Theme.of(context).primaryColorDark,
        bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
        trigger: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
