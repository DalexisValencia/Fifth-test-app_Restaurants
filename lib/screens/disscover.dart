import 'dart:async';

// import 'package:fith_app__restaurant/blocs/bloc/additional/additionals_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/discovery/bloc/discovery_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
// import 'package:fith_app__restaurant/blocs/bloc/productdetails_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Discovery.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/sections/NearYouCard.dart';
import 'package:fith_app__restaurant/sections/NewLauched.dart';
import 'package:fith_app__restaurant/sections/TopRestaurants.dart';
import 'package:fith_app__restaurant/sections/EmptySection.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
// import 'package:fith_app__restaurant/widgets/quickViewCard.dart';
// import 'package:fith_app__restaurant/widgets/quickViewCard.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverScaffold extends StatefulWidget {
  @override
  _DiscoverScaffoldState createState() => _DiscoverScaffoldState();
}

class _DiscoverScaffoldState extends State<DiscoverScaffold> {
  double heightAppBar = 55;
  bool animatedOpacity = true;
  bool animationChildren = true;
  _changeStatusBarThemeColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Theme.of(context).primaryColorLight, // status bar color
    ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

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

  Widget _screenTitle(name) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.015,
        left: MediaQuery.of(context).size.width * 0.07,
        right: MediaQuery.of(context).size.width * 0.07,
        bottom: MediaQuery.of(context).size.height * 0.015,
      ),
      child: Text(
        name.toString().toUpperCase(),
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headline4.copyWith(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _nearYouContainer(nearYou) {
    return BlocProvider<DishBloc>(
      create: (BuildContext context) => DishBloc(),
      child: NearYou(nearYou: nearYou),
    );
    // return NearYou(nearYou: nearYou);
  }

  Widget _newLaunch(List<Dishes> recents) {
    return NewLaunch(newLaunched: recents);
  }

  Widget _topRestaurants(List<Restaurants> restaurants) {
    return TopRestaurants(restaurants: restaurants);
  }

  @override
  Widget build(BuildContext context) {
    _changeStatusBarThemeColor();
    return SafeArea(child: BlocBuilder<DiscoveryBloc, DiscoveryState>(
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
                            _screenTitle(discoveryPropsBloc.name),
                            _nearYouContainer(discoveryPropsBloc.near),
                            _newLaunch(discoveryPropsBloc.newLaunch),
                            _topRestaurants(discoveryPropsBloc.restaurants)
                          ],
                        ),
                      )),
                  Positioned(
                    top: 0,
                    child: MainTopHeader(myheight: heightAppBar),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}

class MainTopHeader extends StatefulWidget {
  final double myheight;
  MainTopHeader({this.myheight});
  @override
  _MainTopHeaderState createState() => _MainTopHeaderState();
}

class _MainTopHeaderState extends State<MainTopHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.07),
      height: widget.myheight,
      color: Theme.of(context).primaryColorLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleIconButton(
            icon: Icons.arrow_back,
            color: Theme.of(context).primaryColorDark,
            bgColor: Theme.of(context).primaryColorLight,
            trigger: () {},
          ),
          CircleIconButton(
            icon: Icons.search,
            color: Theme.of(context).primaryColorDark,
            bgColor: Theme.of(context).accentColor.withOpacity(0.4),
            trigger: () {},
          ),
        ],
      ),
    );
  }
}

class NearYou extends StatefulWidget {
  final List<Dishes> nearYou;
  NearYou({this.nearYou});
  @override
  _NearYouState createState() => _NearYouState();
}

class _NearYouState extends State<NearYou> {
  Widget _header() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.07,
          MediaQuery.of(context).size.height * 0.002,
          0,
          MediaQuery.of(context).size.height * 0.002),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Near you",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).primaryColorDark),
          ),
          MaterialButton(
            padding: EdgeInsets.all(0),
            splashColor: Theme.of(context).buttonColor,
            height: 25,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {},
            child: Text(
              "see all",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }

  Widget _suggestions() {
    return BlocProvider(
        create: (BuildContext context) => DishBloc(),
        child: Container(
          height: 160,
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.nearYou.length,
              itemBuilder: (BuildContext context, int index) {
                return NearYouCard(
                  dish: widget.nearYou[index],
                  index: index,
                );
              }),
        ));
    // return MultiBlocProvider(
    //     providers: [
    //       BlocProvider<DishBloc>(
    //         create: (BuildContext context) => DishBloc(),
    //       ),
    //       BlocProvider<AdditionalsBloc>(
    //         create: (BuildContext context) => AdditionalsBloc(),
    //       )
    //     ],
    //     child: Container(
    //       height: 160,
    //       width: MediaQuery.of(context).size.width,
    //       padding:
    //           EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
    //       child: ListView.builder(
    //           scrollDirection: Axis.horizontal,
    //           itemCount: widget.nearYou.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             return NearYouCard(
    //               dish: widget.nearYou[index],
    //               index: index,
    //             );
    //           }),
    //     ));
  }

  _sectionBody() {
    if (widget.nearYou.length == 0) {
      return EmptySections();
    }
    if (widget.nearYou.length >= 1) {
      return _suggestions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_header(), _sectionBody()],
    );
  }
}

class NewLaunch extends StatefulWidget {
  final List<Dishes> newLaunched;
  NewLaunch({this.newLaunched});
  @override
  _NewLaunchState createState() => _NewLaunchState();
}

class _NewLaunchState extends State<NewLaunch> {
  Widget _header() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.07),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "New Launch",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w800),
          ),
          CircleIconButton(
            icon: Icons.tune,
            color: Theme.of(context).primaryColorDark,
            bgColor: Theme.of(context).primaryColorLight,
            trigger: () {},
          ),
        ],
      ),
    );
  }

  Widget _newLauchContainer() {
    return Container(
      child: Builder(builder: (BuildContext context) {
        List<Widget> _totalLaunched = [];
        widget.newLaunched.asMap().entries
          ..map((e) {
            _totalLaunched
                .add(NewLaunchedWrapper(dish: widget.newLaunched[e.key]));
          }).toList();
        return Column(
          children: _totalLaunched,
        );
      }),
    );
  }

  _sectionBody() {
    if (widget.newLaunched.length == 0) {
      return EmptySections();
    }
    if (widget.newLaunched.length >= 1) {
      return _newLauchContainer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_header(), _sectionBody()],
      ),
    );
  }
}

class TopRestaurants extends StatefulWidget {
  final List<Restaurants> restaurants;
  TopRestaurants({this.restaurants});
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
      child: Column(
        children: <Widget>[
          _header(),
          Builder(
            builder: (BuildContext context) {
              List<Widget> restaurants = [];
              widget.restaurants.asMap().entries.map((e) {
                restaurants.add(MainTopRestaurant(restaurant: e.value));
              }).toList();
              return Column(
                children: restaurants,
              );
            },
          )
          // _topRestaurant(),
          // _nextTops()
        ],
      ),
    );
  }
}
