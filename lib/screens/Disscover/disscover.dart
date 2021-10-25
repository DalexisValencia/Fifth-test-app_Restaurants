import 'dart:async';

import 'package:restaurants/blocs/bloc/discovery/bloc/discovery_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Discovery.dart';
import 'package:restaurants/screens/Disscover/disscover__nearYou.dart';
import 'package:restaurants/screens/Disscover/disscover__newLaunch.dart';
import 'package:restaurants/screens/Disscover/disscover__topRestaurants.dart';
import 'package:restaurants/widgets/AnimationContainerWrapper.dart';
import 'package:restaurants/widgets/Navigation/Navigation.dart';
import 'package:restaurants/widgets/Screen__heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverScaffold extends StatefulWidget {
  @override
  _DiscoverScaffoldState createState() => _DiscoverScaffoldState();
}

class _DiscoverScaffoldState extends State<DiscoverScaffold> {
  double heightAppBar = 55;
  bool animatedOpacity = true;
  bool animationChildren = true;
  // _changeStatusBarThemeColor() {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     // systemNavigationBarColor: Colors.white, // navigation bar color
  //     statusBarColor: Theme.of(context).primaryColorLight, // status bar color
  //   ));
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  // }

  @override
  initState() {
    super.initState();
    this.startAnimationScreen();
  }

  startAnimationScreen() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        animatedOpacity = false;
      });
      startAnimationChildren();
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
    // _changeStatusBarThemeColor();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DiscoveryBloc, DiscoveryState>(
          builder: (BuildContext context, state) {
            Discovery discoveryPropsBloc = state.props[0] as Discovery;
            return AnimatedOpacity(
              duration: Duration(milliseconds: animationOpacityTime),
              opacity: animatedOpacity ? 0 : 1,
              child: CustomContainerAnimation(
                animationChildren: animationChildren,
                children: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          top: heightAppBar,
                        ),
                        color: Theme.of(context).primaryColorLight,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              ScreenHeading(
                                title: discoveryPropsBloc.name!,
                                subtitle: '',
                              ),
                              discoveryPropsBloc.near!.isNotEmpty
                                  ? BlocProvider<DishBloc>(
                                      create: (BuildContext context) =>
                                          DishBloc(),
                                      child: NearYou(
                                        nearYou: discoveryPropsBloc.near,
                                      ),
                                    )
                                  : SizedBox(),
                              discoveryPropsBloc.newLaunch!.isNotEmpty
                                  ? NewLaunch(
                                      newLaunched: discoveryPropsBloc.newLaunch,
                                    )
                                  : SizedBox(),
                              TopRestaurants(
                                restaurants: discoveryPropsBloc.restaurants,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Navigation(
                          secondItem: 'search',
                          category: discoveryPropsBloc.name!,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
