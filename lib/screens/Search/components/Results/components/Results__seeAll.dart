import 'package:flutter/material.dart';

class SeeAllRecents extends StatelessWidget {
  final String title;
  final String to;
  SeeAllRecents({
    this.title,
    this.to,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Align(
        child: MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.transparent,
          splashColor: Theme.of(context).splashColor,
          onPressed: () {},
          child: Text(
            title,
            style: Theme.of(context).textTheme.caption.copyWith(
                decoration: TextDecoration.underline,
                color: Theme.of(context).primaryColorDark),
          ),
        ),
      ),
    );
  }
}
