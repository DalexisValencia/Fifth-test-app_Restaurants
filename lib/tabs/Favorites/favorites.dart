import 'dart:async';
import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/tabs/Favorites/components/favorites__list.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/Navigation/Navigation.dart';
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
  List<Restaurants> selectedRestaurants = [];
  List<Dishes> selectedDishes = [];
  FavoritesBloc instanceFavorite;

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
                  List<Restaurants> restaurantsState = state.props[0];
                  List<Dishes> dishesState = state.props[1];
                  return ScreenHeading(
                    title: 'Favorites',
                    subtitle: restaurantsState.isEmpty && dishesState.isEmpty
                        ? ''
                        : 'Press and hold to select an item',
                  );
                },
              ),
              FavoriteInherited(
                child: FavoriteListScreen(),
                selectedDishes: selectedDishes,
                selectedRestaurants: selectedRestaurants,
              ),
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
                amout: 0,
                onPressed: () {
                  List<dynamic> toDelete = [];
                  toDelete..addAll(selectedDishes)..addAll(selectedRestaurants);
                  // print("eliminar los favoritos seleccinados");
                  // print(selectedDishes);
                  print(selectedRestaurants);
                  // print(":::");
                  // print(toDelete);
                  // print(":::");
                  instanceFavorite.add(
                    FavoriteRemove(
                      toDelete: toDelete,
                    ),
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

class FavoriteInherited extends InheritedWidget {
  FavoriteInherited({
    Key key,
    @required this.selectedDishes,
    @required this.selectedRestaurants,
    @required child,
  }) : super(key: key, child: child);

  final List<Dishes> selectedDishes;
  final List<Restaurants> selectedRestaurants;

  static FavoriteInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FavoriteInherited>();
  }

  @override
  bool updateShouldNotify(FavoriteInherited old) =>
      selectedDishes != old.selectedDishes ||
      selectedRestaurants != old.selectedRestaurants;
}

class ImplementsInheritedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(FavoriteInherited.of(context).selectedDishes);
    return Container(
      child: Column(
        // child: Text("primer widget heredado"),
        children: [
          Text("primer widget heredado"),
          RaisedButton(
            onPressed: () {
              List<Dishes> dishesInherited =
                  FavoriteInherited.of(context).selectedDishes;

              dishesInherited.add(dishes[0]);

              print(FavoriteInherited.of(context).selectedDishes);
            },
            child: Text("add to dishes"),
          )
        ],
      ),
    );
  }
}
