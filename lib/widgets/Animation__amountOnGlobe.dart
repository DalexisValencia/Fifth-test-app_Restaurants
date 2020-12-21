import 'dart:async';

import 'package:flutter/material.dart';

class AnimationAmountCircleCart extends StatefulWidget {
  final int amout;
  AnimationAmountCircleCart({
    this.amout,
  });
  @override
  _AnimationAmountCircleCartState createState() =>
      _AnimationAmountCircleCartState();
}

class _AnimationAmountCircleCartState extends State<AnimationAmountCircleCart>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  bool opacity = false;

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

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void scaleAnimation() {
    animationController.reverse();
    if (widget.amout >= 1) {
      Timer(
        Duration(milliseconds: 500),
        () {
          animationController.forward();
          setState(() {
            opacity = true;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: ScaleTransition(
        scale: animation,
        child: Container(
          width: 12,
          height: 12,
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
    );
  }
}
