import 'dart:async';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/tabs/Favorites/components/favorites__list.dart';
import 'package:restaurants/widgets/AnimationContainerWrapper.dart';
import 'package:restaurants/widgets/Navigation/Navigation.dart';
import 'package:restaurants/widgets/Screen__heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool opacityActive = true;
  bool animatedContainerActive = true;
  late FavoritesBloc instanceFavorite;

  @override
  initState() {
    super.initState();
    _activeAnimationOpacity();
    instanceFavorite = BlocProvider.of<FavoritesBloc>(context);
  }

  _activeAnimationOpacity() {
    Timer(
        Duration(
          milliseconds: animationStartTime,
        ), () {
      setState(() {
        opacityActive = false;
      });
      _activeAnimationContainer();
    });
  }

  _activeAnimationContainer() {
    Timer(
        Duration(
          microseconds: animationStartTime,
        ), () {
      setState(() {
        animatedContainerActive = false;
      });
    });
  }

  Widget _screenBody() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (BuildContext context, state) {
                  List<Restaurants> restaurantsState =
                      state.props[0] as List<Restaurants>;
                  List<Dishes> dishesState = state.props[1] as List<Dishes>;
                  return ScreenHeading(
                    title: 'Favorites',
                    subtitle: restaurantsState.isEmpty && dishesState.isEmpty
                        ? ''
                        : 'Press and hold to select an item',
                  );
                },
              ),
              FavoriteListScreen(),
              SizedBox(
                height: spaceUntilBottom,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: opacityActive ? 0 : 1,
        duration: Duration(
          milliseconds: animationOpacityTime,
        ),
        child: CustomContainerAnimation(
          animationChildren: animatedContainerActive,
          children: Column(
            children: [
              BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (BuildContext context, FavoritesState state) {
                  List<dynamic> selecteds = state.props[2] as List<dynamic>;
                  return Navigation(
                    secondItem: 'trash',
                    amout: selecteds.length,
                    onPressed: () {
                      instanceFavorite.add(
                        FavoriteRemove(),
                      );
                    },
                  );
                },
              ),
              _screenBody(),
            ],
          ),
        ),
      ),
    );
  }
}
