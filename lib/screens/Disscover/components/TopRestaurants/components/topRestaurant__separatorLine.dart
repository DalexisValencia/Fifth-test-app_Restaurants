import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:flutter/material.dart';

class SeparatorLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        right: MediaQuery.of(context).size.width * defaultPadding,
        bottom: 20,
        left: MediaQuery.of(context).size.width * defaultPadding,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).accentColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
