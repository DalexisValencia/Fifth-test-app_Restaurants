import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';

import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/screens/seemoreDishesInRestaurant.dart';
import 'package:fith_app__restaurant/sections/CardAvailableForLunch.dart';
import 'package:fith_app__restaurant/sections/CardCategorySuggested.dart';
import 'package:fith_app__restaurant/sections/ContactMethods.dart';
import 'package:fith_app__restaurant/sections/CustomHeader.dart';
// import 'package:fith_app__restaurant/sections/CardsHighlightRestaurants.dart';
import 'package:fith_app__restaurant/sections/RoundedOptions.dart';
import 'package:fith_app__restaurant/sections/TagsChips.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
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
  ScrollController _controller;

  @override
  void initState() {
    this.animationScreenContainer = this.animationScreenOpacity;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    this.startAnimationOpacity();
  }

  void startAnimationOpacity() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        animationScreenOpacity = false;
      });
      this.startAnimationContainer();
    });
  }

  void startAnimationContainer() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        animationScreenContainer = false;
      });
    });
  }

  _scrollListener() {
    if (_controller.offset > 100 && !minSizeReached) {
      setState(() {
        minSizeReached = true;
      });
    }
    if (_controller.offset < 100 && minSizeReached) {
      setState(() {
        minSizeReached = false;
      });
    }
  }

  Widget _headerCustom() {
    return AnimatedContainer(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: minSizeReached
                      ? Theme.of(context).primaryColorDark.withOpacity(0.3)
                      : Colors.transparent,
                  width: 1)),
          color: Theme.of(context).primaryColorLight,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: Offset(0, 2),
                color: minSizeReached
                    ? Theme.of(context).accentColor
                    : Colors.transparent)
          ]),
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

  Widget _bodyRestaurantsDetail() {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    double lessHeight =
        (MediaQuery.of(context).padding.top + defaultHeaderCustomHeight);
    return AnimatedOpacity(
        duration:
            Duration(milliseconds: animationOpacityTime), //animationOpacityTime
        opacity: animationScreenOpacity ? 0 : 1,
        child: Container(
            height: MediaQuery.of(context).size.height - lessHeight,
            child: SingleChildScrollView(
              controller: _controller,
              child: CustomContainerAnimation(
                  animationChildren: animationScreenContainer,
                  children: BlocBuilder<DetailsrestaurantBloc,
                      DetailsrestaurantState>(
                    builder:
                        (BuildContext context, DetailsrestaurantState state) {
                      Restaurants currentRestaurant = state.props[0];
                      return Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03),
                            padding: EdgeInsets.symmetric(
                                horizontal: withDefaultPadding),
                            width: MediaQuery.of(context).size.width,
                            child: TitleAndShortDescription(
                                title: currentRestaurant.name,
                                description: currentRestaurant.description),
                          ),
                          WrapperMap(),
                          currentRestaurant.lunchNow.length >= 1
                              ? DetailHighlightProduct(
                                  highlishDishes: currentRestaurant.lunchNow)
                              : SizedBox(),
                          currentRestaurant.tagsMenu.length >= 1
                              ? ExploreTheMenu(
                                  tags: currentRestaurant.tagsMenu,
                                  restaurantName: currentRestaurant.name,
                                )
                              : SizedBox(),
                          currentRestaurant.suggestions.length >= 1
                              ? BlocProvider(
                                  create: (BuildContext context) => DishBloc(),
                                  child: CardCategorySuggested(
                                      suggestions:
                                          currentRestaurant.suggestions),
                                )
                              : SizedBox(),
                          // CustomContainerAnimation(
                          //   animationChildren: animationScreenContainer,
                          //   children: HightlightResturantsWrapper(),
                          // ),
                          RoundedOptionsContactWrapper(),
                          currentRestaurant.contact.length >= 1
                              ? ContactMethods(
                                  contact: currentRestaurant.contact)
                              : SizedBox(),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      );
                    },
                  )
                  //
                  ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SafeArea(
      child: Column(
        children: <Widget>[_headerCustom(), _bodyRestaurantsDetail()],
      ),
    )));
  }
}

class TitleAndShortDescription extends StatelessWidget {
  final String title;
  final String description;
  TitleAndShortDescription({this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(description)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: CircleIconButton(
            icon: Icons.favorite_border,
            color: Theme.of(context).primaryColorDark,
            bgColor: Colors.transparent,
            trigger: () {},
          ),
        )
      ],
    );
  }
}

class WrapperMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
      color: Theme.of(context).accentColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
    );
  }
}

class DetailHighlightProduct extends StatefulWidget {
  final List<Dishes> highlishDishes;
  DetailHighlightProduct({this.highlishDishes});
  @override
  _DetailHighlightProductState createState() => _DetailHighlightProductState();
}

class _DetailHighlightProductState extends State<DetailHighlightProduct> {
  @override
  initState() {
    super.initState();
  }

  Widget _wrapperHeader() {
    final restaurantBloc = BlocProvider.of<DetailsrestaurantBloc>(context);
    return FullSectionTitle(
      title: 'Available for lunch now',
      rightContainer: RoundedCustomButton(
          title: 'See all',
          callPressed: () {
            // Navigator.of(context).push(
            //     MaterialPageRoute<SeeMoreDishesByRestaurant>(
            //         builder: (context) {
            //   return BlocProvider.value(
            //     value: restaurantBloc,
            //     child: SeeMoreDishesByRestaurant(searchKey: 'lunchNow'),
            //   );
            // }));
            Navigator.of(context).push(PageRouteBuilder(
                //
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
                  return BlocProvider.value(
                    value: restaurantBloc,
                    child: SeeMoreDishesByRestaurant(searchKey: 'lunchNow'),
                  );
                },
                transitionsBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation, Widget child) {
                  var begin = Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.easeInSine;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                }));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.01,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: withDefaultPadding),
            child: _wrapperHeader(),
          ),
          Container(
              margin: EdgeInsets.only(left: withDefaultPadding - 10),
              child: Align(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 2 / 2.030,
                  child: Container(
                    child: BlocProvider(
                      create: (BuildContext context) => DishBloc(),
                      child: CompleteListAvailablePlates(
                          dishes: widget.highlishDishes),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
