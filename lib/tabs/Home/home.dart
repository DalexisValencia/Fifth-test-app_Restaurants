import 'dart:async';

import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/tabs/Home/Components/home__whatAreYouLooking.dart';
import 'package:restaurants/tabs/Home/components/home__categoriesSuggested.dart';
import 'package:restaurants/tabs/Home/components/home__fixedTopMenu.dart';
import 'package:restaurants/tabs/Home/components/home__heading.dart';
import 'package:restaurants/widgets/AnimationContainerWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  final TabController? controller;
  final bool? animateScreen;
  HomePage({
    this.controller,
    this.animateScreen,
  });
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool animateOpacity = false;
  bool animationChildren = false;
  @override
  void initState() {
    this.animateOpacity = widget.animateScreen!;
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

  @override
  Widget build(BuildContext context) {
    this.changeSystemBarColor();
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Scaffold(
      body: AnimatedOpacity(
        opacity: animateOpacity ? 0 : 1,
        duration: Duration(
          milliseconds: animationOpacityTime,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                      'assets/banner/break-fast.png',
                    ),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      top: MediaQuery.of(context).padding.top,
                      child: FixedTopMenu(),
                    ),
                    Positioned(
                      left: withDefaultPadding,
                      top: MediaQuery.of(context).size.height * 0.14,
                      child: CustomContainerAnimation(
                        animationChildren: animationChildren,
                        children: HomeHeading(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                transform: Matrix4.translationValues(
                  0,
                  -MediaQuery.of(context).size.width * 0.07,
                  0,
                ),
                child: Column(
                  children: <Widget>[
                    //Search Field
                    CustomContainerAnimation(
                      animationChildren: animationChildren,
                      children: WhatAreYouLookinForFormWrapper(),
                    ),
                    // Categories Card
                    CustomContainerAnimation(
                      animationChildren: animationChildren,
                      children: HomeCategoriesSuggested(),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
