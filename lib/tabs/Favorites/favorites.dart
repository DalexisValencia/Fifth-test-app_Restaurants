import 'dart:async';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/tabs/Favorites/components/favorites__list.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/Navigation/Navigation.dart';
import 'package:fith_app__restaurant/widgets/Screen__heading.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool opacityActive = true;
  bool animatedContainerActive = true;
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
              Navigation(
                secondItem: 'trash',
                // amout: forDelete.length,
                amout: 0,
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
