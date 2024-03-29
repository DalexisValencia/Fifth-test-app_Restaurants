import 'package:restaurants/widgets/Button_roundWithIcon.dart';
import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  final Color? iconColor;
  final Function? goBack;
  GoBackButton({
    this.iconColor,
    this.goBack,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: CircleIconButton(
        icon: Icons.arrow_back,
        color:
            iconColor == null ? Theme.of(context).primaryColorDark : iconColor!,
        bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
        // trigger: () {
        //   Navigator.pop(context);
        // },
        trigger: () => goBack!(),
      ),
    );
  }
}
