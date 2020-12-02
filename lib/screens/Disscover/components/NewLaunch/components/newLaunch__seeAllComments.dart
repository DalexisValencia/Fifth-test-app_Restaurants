import 'package:flutter/material.dart';

class SeeAllCommentsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        splashColor: Theme.of(context).buttonColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minWidth: 10,
        height: 10,
        onPressed: () {},
        child: Text(
          "See All",
          style: TextStyle(
            fontSize: 10,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
    );
  }
}
