import 'dart:async';

import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/screens/Home/Components/home__whatAreYouLooking.dart';
import 'package:fith_app__restaurant/sections/HomeCategoryCardSuggested.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';
import 'package:fith_app__restaurant/screens/search.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  @override
  void initState() {
    this.animateOpacity = widget.animateScreen;
    this.animationChildren = this.animateOpacity;
    super.initState();
    this.setAnimationState();
  }

  void changeSystemBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Theme.of(context).buttonColor, // status bar color
    ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  setAnimationState() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        animateOpacity = false;
      });
      this.startAnimationChildren();
    });
  }

  startAnimationChildren() {
    Timer(Duration(milliseconds: animationStartTime), () {
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
    return CustomContainerAnimation(
        animationChildren: animationChildren,
        children: WhatAreYouLookinForFormWrapper());
  }

  Widget _categoryContainerSuggested() {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: withDefaultPadding,
          right: withDefaultPadding),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Builder(builder: (BuildContext context) {
        List<Widget> _categoriesCard = [];
        categories.asMap().entries.map((item) {
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
    this.changeSystemBarColor();
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Scaffold(
        body: AnimatedOpacity(
      opacity: animateOpacity ? 0 : 1,
      duration: Duration(milliseconds: animationOpacityTime),
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
            child: Container(
              transform: Matrix4.translationValues(
                  0, -MediaQuery.of(context).size.width * 0.07, 0),
              // color: Colors.red,
              child: Column(
                children: <Widget>[
                  _containerSearch(),
                  CustomContainerAnimation(
                      animationChildren: animationChildren,
                      children: _categoryContainerSuggested())
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
