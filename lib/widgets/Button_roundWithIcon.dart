import 'package:flutter/material.dart';

class CircleIconButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Color bgColor;
  final Function trigger;
  CircleIconButton({
    this.icon,
    this.color,
    this.bgColor,
    this.trigger,
  });
  @override
  _CircleIconButtonState createState() => _CircleIconButtonState();
}

class _CircleIconButtonState extends State<CircleIconButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      elevation: 0,
      splashColor: Theme.of(context).buttonColor,
      onPressed: () {},
      onHighlightChanged: (value) {
        if (value == false) {
          // print('yo solo lo ejecuto cuando el onHighlightChanged sea falso');
          widget.trigger();
        }
      },
      color: widget.bgColor,
      padding: EdgeInsets.all(0),
      shape: CircleBorder(),
      child: Icon(
        widget.icon,
        size: 22,
        color: widget.color,
      ),
    );
  }
}
