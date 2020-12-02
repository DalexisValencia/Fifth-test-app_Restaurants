import 'dart:async';

import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/Navigation/Navigation.dart';
import 'package:fith_app__restaurant/widgets/Dish__card.dart';
import 'package:fith_app__restaurant/widgets/Screen__heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool opacityActive = true;
  bool animatedContainerActive = true;
  List<int> forDelete = [];
  @override
  initState() {
    super.initState();
    _activeAnimationOpacity();
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

  Widget _builderCardFavorites() {
    List favoritesExample = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * defaultPadding,
      ),
      child: BlocProvider(
        create: (BuildContext context) => DishBloc(),
        child: Builder(
          builder: (BuildContext context) {
            List<Widget> favoriteCards = [];
            favoritesExample.asMap().entries.map((e) {
              int index = e.key;
              favoriteCards.add(
                GestureDetector(
                  onLongPress: () {
                    var isInList = forDelete.contains(index);
                    setState(
                      () {
                        if (isInList == false) {
                          forDelete.add(index);
                        }
                        if (isInList == true) {
                          forDelete.remove(index);
                        }
                      },
                    );
                  },
                  child: DishCard(
                    dish: dishes[0],
                    borderCustomColor: forDelete.contains(index) ? true : false,
                  ),
                ),
              );
            }).toList();
            return Column(
              children: favoriteCards,
            );
          },
        ),
      ),
    );
  }

  Widget _screenBody() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ScreenHeading(
                title: 'Favorites',
                subtitle: 'Press and hold to select an item',
              ),
              _builderCardFavorites(),
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
              Navigation(
                secondItem: 'trash',
                amout: forDelete.length,
                onPressed: () {
                  print("eliminar los favoritos seleccinados");
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