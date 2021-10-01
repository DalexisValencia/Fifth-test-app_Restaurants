import 'package:restaurants/widgets/Animation__amountOnGlobe.dart';
import 'package:restaurants/widgets/Button_roundWithIcon.dart';
import 'package:flutter/material.dart';

class TrashButton extends StatefulWidget {
  final Color? iconColor;
  final int? amout;
  final Function? onClick;
  TrashButton({
    this.amout,
    this.onClick,
    this.iconColor,
  });
  @override
  _TrashButtonState createState() => _TrashButtonState();
}

class _TrashButtonState extends State<TrashButton> {
  bool opacity = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          CircleIconButton(
            icon: Icons.delete,
            color: widget.iconColor == null
                ? Theme.of(context).primaryColorDark
                : widget.iconColor!,
            bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
            trigger: widget.onClick!,
          ),
          Positioned(
            top: 2,
            left: 3,
            child: AnimationAmountGlobeCart(
              amout: widget.amout!,
            ),
          )
        ],
      ),
    );
  }
}
