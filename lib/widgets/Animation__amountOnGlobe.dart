import 'dart:async';

import 'package:flutter/material.dart';

class AnimationAmountGlobeCart extends StatefulWidget {
  final int amout;
  AnimationAmountGlobeCart({
    this.amout,
  });
  @override
  _AnimationAmountGlobeCartState createState() =>
      _AnimationAmountGlobeCartState();
}

class _AnimationAmountGlobeCartState extends State<AnimationAmountGlobeCart>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  String stateAnimation = '';

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
    forward();
  }

  void forward() {
    animationController.forward();
  }

  void reverse() {
    animationController.reverse();
  }

  void bounceCircle() {
    reverse();
    if (widget.amout >= 1) {
      Timer(
          Duration(
            milliseconds: 500,
          ), () {
        forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bounceCircle();
    // return Container(
    //   width: 40,
    //   height: 40,
    //   child:

    return Visibility(
      visible: widget.amout >= 1,
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
        // ),
      ),
    );
  }
}
