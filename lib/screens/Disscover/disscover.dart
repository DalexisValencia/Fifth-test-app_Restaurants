import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/discovery/bloc/discovery_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Discovery.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/screens/Disscover/components/NearYou/nearYou.dart';
import 'package:fith_app__restaurant/screens/Disscover/components/NewLaunch/newLaunch.dart';
// import 'package:fith_app__restaurant/sections/NearYouCard.dart';
import 'package:fith_app__restaurant/sections/TopRestaurants.dart';
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

  Widget _newLaunch(List<Dishes> recents) {
    return NewLaunch(newLaunched: recents);
  }

  Widget _topRestaurants(List<Restaurants> restaurants) {
    return TopRestaurants(restaurants: restaurants);
  }

  @override
  Widget build(BuildContext context) {
    // _changeStatusBarThemeColor();
    return Scaffold(body: SafeArea(
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
                      padding: EdgeInsets.only(top: heightAppBar),
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
                                        nearYou: discoveryPropsBloc.near),
                                  )
                                : SizedBox(),
                            discoveryPropsBloc.newLaunch.isNotEmpty
                                ? NewLaunch(
                                    newLaunched: discoveryPropsBloc.newLaunch,
                                  )
                                : SizedBox(),
                            _topRestaurants(discoveryPropsBloc.restaurants)
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
    ));
  }
}

class TopRestaurants extends StatefulWidget {
  final List<Restaurants> restaurants;
  TopRestaurants({
    this.restaurants,
  });
  @override
  _TopRestaurantsState createState() => _TopRestaurantsState();
}

class _TopRestaurantsState extends State<TopRestaurants> {
  Widget _header() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.010),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Top Retaurants",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w800),
          ),
          MaterialButton(
            padding: EdgeInsets.all(0),
            elevation: 0,
            onPressed: () {},
            color: Theme.of(context).primaryColorLight,
            splashColor: Theme.of(context).buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              "See all",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  Widget _body() {
    return BlocProvider(
      create: (BuildContext context) => DetailsrestaurantBloc(),
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> restaurants = [];
          widget.restaurants.asMap().entries.map((e) {
            restaurants.add(
              MainTopRestaurant(
                restaurant: e.value,
              ),
            );
          }).toList();
          return Column(
            children: restaurants,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * defaultPadding,
      ),
      child: Column(
        children: <Widget>[
          _header(),
          _body(),
        ],
      ),
    );
  }
}
