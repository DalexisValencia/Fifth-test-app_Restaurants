import 'package:flutter/material.dart';

class CustomContainerAnimation extends StatefulWidget {
  final bool? animationChildren;
  final Widget? children;
  CustomContainerAnimation({
    this.animationChildren,
    this.children,
  });
  @override
  _CustomContainerAnimationState createState() =>
      _CustomContainerAnimationState();
}

class _CustomContainerAnimationState extends State<CustomContainerAnimation>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: widget.animationChildren! ? 0 : 1,
        child: AnimatedContainer(
          curve: Curves.ease,
          transform: Matrix4.translationValues(
              widget.animationChildren!
                  ? -MediaQuery.of(context).size.width * 0.50
                  : 0,
              0,
              0),
          duration: Duration(milliseconds: 500),
          child: widget.children,
        ));
  }
}
