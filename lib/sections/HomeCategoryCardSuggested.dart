import 'dart:async';

import 'package:fith_app__restaurant/interfaces/categories.dart';
import 'package:flutter/material.dart';

class HomeCardCategorySuggested extends StatefulWidget {
  final Category category;
  final TabController controller;
  HomeCardCategorySuggested({this.category, this.controller});

  @override
  _HomeCardCategorySuggestedState createState() =>
      _HomeCardCategorySuggestedState();
}

class _HomeCardCategorySuggestedState extends State<HomeCardCategorySuggested> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      onPressed: () {
        Timer(Duration(milliseconds: 200), () {
          print(widget.category.name);
          // widget.controller.animateTo(4);
        });
      },
      color: Theme.of(context).primaryColorLight,
      splashColor: Theme.of(context).buttonColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(widget.category.iconSource))),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.category.name,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).primaryColorDark,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
