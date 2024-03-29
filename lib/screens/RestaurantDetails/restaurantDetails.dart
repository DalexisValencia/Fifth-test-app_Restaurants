import 'dart:async';

import 'package:restaurants/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:restaurants/constants/contansts.dart';

import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/screens/RestaurantDetails/restaurantDetails__features.dart';
import 'package:restaurants/screens/RestaurantDetails/restaurantDetails__hightlight.dart';
import 'package:restaurants/screens/RestaurantDetails/restaurantDetails__map.dart';
import 'package:restaurants/screens/RestaurantDetails/restaurantDetails__suggestions.dart';
import 'package:restaurants/screens/RestaurantDetails/restaurantDetails__contact.dart';
import 'package:restaurants/screens/RestaurantDetails/restaurantDetails__shared.dart';
import 'package:restaurants/screens/RestaurantDetails/restaurantDetails__categories.dart';
import 'package:restaurants/widgets/AnimationContainerWrapper.dart';
import 'package:restaurants/widgets/Navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantDetailWrapper extends StatefulWidget {
  @override
  _RestaurantDetailWrapperState createState() =>
      _RestaurantDetailWrapperState();
}

class _RestaurantDetailWrapperState extends State<RestaurantDetailWrapper>
    with SingleTickerProviderStateMixin {
  bool minSizeReached = false;
  bool animationScreenOpacity = true;
  bool animationScreenContainer = true;
  late ScrollController _controller;

  @override
  void initState() {
    this.animationScreenContainer = this.animationScreenOpacity;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    this.startAnimationOpacity();
  }

  void startAnimationOpacity() {
    Timer(
      Duration(milliseconds: animationStartTime),
      () {
        setState(
          () {
            animationScreenOpacity = false;
          },
        );
        this.startAnimationContainer();
      },
    );
  }

  void startAnimationContainer() {
    Timer(
      Duration(milliseconds: animationStartTime),
      () {
        setState(
          () {
            animationScreenContainer = false;
          },
        );
      },
    );
  }

  _scrollListener() {
    if (_controller.offset > 100 && !minSizeReached) {
      setState(
        () {
          minSizeReached = true;
        },
      );
    }
    if (_controller.offset < 100 && minSizeReached) {
      setState(
        () {
          minSizeReached = false;
        },
      );
    }
  }

  Widget _bodyRestaurantsDetail(Restaurants currentRestaurant) {
    double lessHeight =
        (MediaQuery.of(context).padding.top + defaultHeaderCustomHeight);
    return AnimatedOpacity(
      duration: Duration(
        milliseconds: animationOpacityTime,
      ), //animationOpacityTime
      opacity: animationScreenOpacity ? 0 : 1,
      child: Container(
        height: MediaQuery.of(context).size.height - lessHeight,
        child: SingleChildScrollView(
          controller: _controller,
          child: CustomContainerAnimation(
              animationChildren: animationScreenContainer,
              children: Column(
                children: <Widget>[
                  RestaurantdetailFeatures(
                    title: currentRestaurant.name,
                    subtitle: currentRestaurant.description,
                  ),
                  RestaurantdetailMap(),
                  currentRestaurant.lunchNow!.isNotEmpty
                      ? RestaurantdetailHighlight(
                          highlishDishes: currentRestaurant.lunchNow,
                        )
                      : SizedBox(),
                  currentRestaurant.tagsMenu!.isNotEmpty
                      ? RestaurantdetailCategories(
                          tags: currentRestaurant.tagsMenu,
                          restaurantName: currentRestaurant.name,
                        )
                      : SizedBox(),
                  currentRestaurant.suggestions!.isNotEmpty
                      ? RestaurantDetailSuggestions(
                          suggestions: currentRestaurant.suggestions,
                        )
                      : SizedBox(),
                  RestaurantDetailsShared(),
                  currentRestaurant.contact!.isNotEmpty
                      ? RestaurantDetailsContact(
                          contact: currentRestaurant.contact,
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 40,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DetailsrestaurantBloc, DetailsrestaurantState>(
          builder: (BuildContext context, DetailsrestaurantState state) {
            Restaurants currentRestaurant = state.props[0] as Restaurants;
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Navigation(
                    secondItem: 'search',
                    category: currentRestaurant.name!,
                    goBack: () {
                      Navigator.pop(context);
                    },
                  ),
                  _bodyRestaurantsDetail(currentRestaurant),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
