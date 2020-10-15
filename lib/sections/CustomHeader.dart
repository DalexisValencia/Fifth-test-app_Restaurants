import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  final Color iconColors;
  CustomHeader({this.iconColors});
  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.07),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            child: CircleIconButton(
              icon: Icons.arrow_back,
              color: widget.iconColors,
              bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
              trigger: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            width: 40,
            height: 40,
            child: CircleIconButton(
              icon: Icons.favorite,
              color: widget.iconColors,
              bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
              trigger: () {},
            ),
          ),
        ],
      ),
    );
  }
}
