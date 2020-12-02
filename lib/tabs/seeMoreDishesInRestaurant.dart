import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/sections/CustomHeader.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/Popular__dishCardComment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeMoreDishesByRestaurant extends StatefulWidget {
  final String searchKey;
  SeeMoreDishesByRestaurant({this.searchKey});
  @override
  _SeeMoreDishesByRestaurantState createState() =>
      _SeeMoreDishesByRestaurantState();
}

class _SeeMoreDishesByRestaurantState extends State<SeeMoreDishesByRestaurant> {
  bool animationState = true;
  @override
  initState() {
    super.initState();
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        animationState = false;
      });
    });
  }

  @override
  dispose() {
    super.dispose();
  }

  Widget _screenTitle(name, results) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            name.toString().toUpperCase(),
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.015,
          ),
          child: RichText(
            text: TextSpan(
                text: "Total Registers: ",
                style: Theme.of(context).textTheme.button.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
                children: <TextSpan>[
                  TextSpan(
                      text: results.toString(),
                      style: TextStyle(fontWeight: FontWeight.w400))
                ]),
          ),
        )
      ],
    );
  }

  Widget _dishesList() {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * defaultPadding,
            vertical: 30),
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).padding.top + defaultHeaderCustomHeight),
        child: SingleChildScrollView(
          child: BlocBuilder<DetailsrestaurantBloc, DetailsrestaurantState>(
            builder: (BuildContext context, DetailsrestaurantState state) {
              Restaurants restaurantState = state.props[0];
              List<Dishes> completeList;
              String screenTitle = '';
              switch (widget.searchKey) {
                case 'lunchNow':
                  completeList = restaurantState.lunchNow;
                  screenTitle = 'New Launch';
                  break;
                case 'suggestions':
                  completeList = restaurantState.suggestions;
                  screenTitle = 'Suggestions';
                  break;
                default:
                  completeList = [];
              }
              return Column(
                children: <Widget>[
                  _screenTitle(screenTitle, completeList.length),
                  BlocProvider(
                    create: (BuildContext context) => DishBloc(),
                    child: Builder(
                      builder: (BuildContext context) {
                        return BlocProvider(
                            create: (BuildContext context) => DishBloc(),
                            child: Column(
                                children: completeList
                                    .map((item) => new DishCardComment(
                                        dish: item)) // PENDIENTE PARA REVISION
                                    .toList()));
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }

  Widget _header() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: defaultHeaderCustomHeight,
      width: MediaQuery.of(context).size.width,
      child: CustomHeader(
        firstAction: 'goBack',
        secondAction: 'search',
        iconColors: Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _seeMoreBody() {
    return Column(
      children: <Widget>[
        _header(),
        _dishesList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: SafeArea(
            child: CustomContainerAnimation(
          animationChildren: animationState,
          children: _seeMoreBody(),
        )));
  }
}
