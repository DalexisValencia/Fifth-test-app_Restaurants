import 'dart:async';

import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/categories.dart';
import 'package:fith_app__restaurant/sections/HomeCategoryCardSuggested.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';
import 'package:fith_app__restaurant/screens/seacrh.dart';

/*
import 'package:flutter/services.dart';
setStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.black, // status bar color
  ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}
*/
class HomePage extends StatefulWidget {
  final TabController controller;
  final bool animateScreen;
  HomePage({this.controller, this.animateScreen});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool animateOpacity = false;
  bool animationChildren = false;
  List<Category> _categories = [
    Category('Break Fast', Icons.store_mall_directory,
        'assets/home-categories/category-1.png'),
    Category('Food', Icons.sentiment_neutral,
        'assets/home-categories/category-2.png'),
    Category('Wine', Icons.sentiment_neutral,
        'assets/home-categories/category-3.png'),
    Category('Coffee', Icons.store_mall_directory,
        'assets/home-categories/category-4.png'),
    Category('Meat', Icons.sentiment_neutral,
        'assets/home-categories/category-5.png'),
    Category('Beer', Icons.sentiment_neutral,
        'assets/home-categories/category-6.png'),
  ];
  @override
  void initState() {
    this.animateOpacity = widget.animateScreen;
    this.animationChildren = this.animateOpacity;
    super.initState();
    this.setAnimationState();
  }

  setAnimationState() {
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        animateOpacity = false;
      });
      this.startAnimationChildren();
    });
  }

  startAnimationChildren() {
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        animationChildren = false;
      });
    });
  }

  Widget _topHeadinng() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            "Have a Good day",
            style: Theme.of(context).textTheme.headline5.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorLight,
              shadows: [
                Shadow(
                  blurRadius: 15.0,
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            'Restaurants waiting for you',
            style: Theme.of(context).textTheme.subtitle2.copyWith(
              fontWeight: FontWeight.normal,
              color: Theme.of(context).primaryColorLight,
              shadows: [
                Shadow(
                  blurRadius: 15.0,
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _containerSearch() {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return CustomContainerAnimation(
      animationChildren: animationChildren,
      children: Container(
          padding: EdgeInsets.symmetric(horizontal: withDefaultPadding),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // color: Colors.red
              ),
          transform: Matrix4.translationValues(
              0, -MediaQuery.of(context).size.width * 0.07, 0),
          child: Hero(
            tag: 'search',
            child: WhatAreYouLookinForForm(),
          )),
    );
  }

  Widget _categoryContainerSuggested() {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: withDefaultPadding,
          right: withDefaultPadding),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Builder(builder: (BuildContext context) {
        List<Widget> _categoriesCard = [];
        _categories.asMap().entries.map((item) {
          _categoriesCard.add(
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, -3),
                      color: Theme.of(context).accentColor.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 1),
                ],
                borderRadius: BorderRadius.circular(7),
              ),
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.30 / 2,
              child: HomeCardCategorySuggested(
                  category: item.value, controller: widget.controller),
            ),
          );
        }).toList();
        return Wrap(
          spacing: MediaQuery.of(context).size.height * 0.02,
          runSpacing: MediaQuery.of(context).size.height * 0.02,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: _categoriesCard,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return AnimatedOpacity(
      opacity: animateOpacity ? 0 : 1,
      duration: Duration(milliseconds: 500),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage('assets/banner/break-fast.png'))),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: MediaQuery.of(context).padding.top,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: withDefaultPadding - 5,
                          right: withDefaultPadding - 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CircleIconButton(
                            icon: Icons.arrow_back,
                            color: Theme.of(context).primaryColorLight,
                            bgColor:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            trigger: () {},
                          ),
                          CircleIconButton(
                            icon: Icons.favorite,
                            color: Theme.of(context).primaryColorLight,
                            bgColor: Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.4),
                            trigger: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: withDefaultPadding,
                    top: MediaQuery.of(context).size.height * 0.14,
                    child: CustomContainerAnimation(
                      animationChildren: animationChildren,
                      children: _topHeadinng(),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            // what are you looking for
            child: Column(
              children: <Widget>[
                _containerSearch(),
                CustomContainerAnimation(
                    animationChildren: animationChildren,
                    children: _categoryContainerSuggested())
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class WhatAreYouLookinForForm extends StatefulWidget {
  @override
  _WhatAreYouLookinForFormState createState() =>
      _WhatAreYouLookinForFormState();
}

class _WhatAreYouLookinForFormState extends State<WhatAreYouLookinForForm> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      splashColor: Theme.of(context).buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      padding: EdgeInsets.fromLTRB(14, 13, 10, 13),
      color: Theme.of(context).primaryColorLight,
      onPressed: () {
        Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(
            builder: (context) => ScaffoldSearch(), maintainState: false));
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ScaffoldSearch()));
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: Theme.of(context).primaryColorDark,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Text(
            'What are you looking for?',
            style: TextStyle(
                color: Theme.of(context).primaryColorDark, fontSize: 12),
          )
        ],
      ),
    );
  }
}
