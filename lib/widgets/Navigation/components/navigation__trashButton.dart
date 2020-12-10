import 'dart:async';

import 'package:fith_app__restaurant/widgets/Button_roundWithIcon.dart';
import 'package:flutter/material.dart';

class TrashButton extends StatefulWidget {
  final Color iconColor;
  final int amout;
  final Function onClick;
  TrashButton({
    this.amout,
    this.onClick,
    this.iconColor,
  });
  @override
  _TrashButtonState createState() => _TrashButtonState();
}

class _TrashButtonState extends State<TrashButton>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  bool opacity = false;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(
        milliseconds: 200,
      ),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    );
  }

  void scaleAnimation() {
    animationController.reverse();
    opacity = false;

    if (widget.amout >= 1) {
      Timer(
        Duration(milliseconds: 500),
        () {
          animationController.forward();
          opacity = true;
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scaleAnimation();
    return Container(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          CircleIconButton(
            icon: Icons.delete,
            color: widget.iconColor == null
                ? Theme.of(context).primaryColorDark
                : widget.iconColor,
            bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
            trigger: widget.onClick,
          ),
          Positioned(
            top: 2,
            left: 3,
            child: ScaleTransition(
              scale: animation,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedOpacity(
                  opacity: widget.amout == 0 || widget.amout == null ? 0 : 1,
                  duration: Duration(
                    milliseconds: 700,
                  ),
                  child: Center(
                    child: Text(
                      widget.amout == 0 || widget.amout == null
                          ? ''
                          : widget.amout.toString(),
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: widget.amout >= 10 ? 7 : 9,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColorLight,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
