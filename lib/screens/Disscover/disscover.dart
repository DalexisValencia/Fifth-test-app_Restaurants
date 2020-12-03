import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/discovery/bloc/discovery_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Discovery.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/screens/Disscover/components/NearYou/nearYou.dart';
import 'package:fith_app__restaurant/screens/Disscover/components/NewLaunch/newLaunch.dart';
import 'package:fith_app__restaurant/screens/Disscover/components/TopRestaurants/topRestaurants.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/Navigation/Navigation.dart';
import 'package:fith_app__restaurant/widgets/Screen__heading.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
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
            Discovery discoveryPropsBloc = state.props[0];
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
                                title: discoveryPropsBloc.name,
                                subtitle: '',
                              ),
                              discoveryPropsBloc.near.isNotEmpty
                                  ? BlocProvider<DishBloc>(
                                      create: (BuildContext context) =>
                                          DishBloc(),
                                      child: NearYou(
                                        nearYou: discoveryPropsBloc.near,
                                      ),
                                    )
                                  : SizedBox(),
                              discoveryPropsBloc.newLaunch.isNotEmpty
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
                          category: discoveryPropsBloc.name,
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
