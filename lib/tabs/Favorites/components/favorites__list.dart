import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/tabs/Favorites/components/favorites__EmptyList.dart';
import 'package:fith_app__restaurant/tabs/Favorites/components/list__CardDish.dart';
import 'package:fith_app__restaurant/tabs/Favorites/components/list__CardRestaurant.dart';
import 'package:fith_app__restaurant/tabs/Favorites/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListScreen extends StatefulWidget {
  @override
  _FavoriteListScreenState createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  List<int> forDelete = [];
  // List<Dishes> dishesDelete = [];
  // List<Restaurants> restaurantDelete = [];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * defaultPadding,
      ),
      child: Column(
        children: [
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (BuildContext context, FavoritesState state) {
              List<Restaurants> restaurants = state.props[0];
              List<Dishes> dishes = state.props[1];
              List<Dishes> dishesDelete =
                  FavoriteInherited.of(context).selectedDishes;
              List<Restaurants> restaurantDelete =
                  FavoriteInherited.of(context).selectedRestaurants;
              return Column(
                children: [
                  dishes.isEmpty && restaurants.isEmpty
                      ? EmptyFavoriteList()
                      : SizedBox(),
                  restaurants.isEmpty
                      ? SizedBox()
                      : FavoriteList(
                          list: restaurants,
                          selecteds: restaurantDelete,
                          onLongPressCallBack: (e) {
                            if (restaurantDelete.contains(e)) {
                              setState(() {
                                restaurantDelete.remove(e);
                              });
                            } else if (!restaurantDelete.contains(e)) {
                              setState(() {
                                restaurantDelete.add(e);
                              });
                            }
                          },
                        ),
                  dishes.isEmpty
                      ? SizedBox()
                      : FavoriteList(
                          list: dishes,
                          selecteds: dishesDelete,
                          onLongPressCallBack: (e) {
                            if (dishesDelete.contains(e)) {
                              setState(() {
                                dishesDelete.remove(e);
                              });
                            } else if (!dishesDelete.contains(e)) {
                              setState(() {
                                dishesDelete.add(e);
                              });
                            }
                          },
                        ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class FavoriteList extends StatelessWidget {
  final List<dynamic> list;
  final List<dynamic> selecteds;
  final Function onLongPressCallBack;
  FavoriteList({
    this.list,
    this.onLongPressCallBack,
    this.selecteds,
  });
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        List<Widget> favorites = [];
        Widget card;
        list.asMap().entries.map((e) {
          if (list is List<Restaurants>) {
            card = FavoriteListCardRestaurant(
              restaurant: list[e.key],
              selected: selecteds.contains(
                list[e.key],
              ),
            );
          } else {
            card = FavoriteListCardDish(
              dish: list[e.key],
              borderCustomColor: selecteds.contains(
                list[e.key],
              ),
            );
          }
          favorites.add(
            GestureDetector(
              onLongPress: () => onLongPressCallBack(
                list[e.key],
              ),
              child: card,
            ),
          );
        }).toList();

        return Column(
          children: favorites,
        );
      },
    );
  }
}
