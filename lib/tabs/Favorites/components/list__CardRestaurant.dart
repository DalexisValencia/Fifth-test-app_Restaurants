import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/widgets/Hightlight__resturantsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListCardRestaurant extends StatelessWidget {
  final Restaurants restaurant;
  final bool selected;
  FavoriteListCardRestaurant({
    this.restaurant,
    this.selected,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsrestaurantBloc>(
      create: (BuildContext context) => DetailsrestaurantBloc(),
      child: HightlightResturantsCard(
        hightlight: restaurant,
        selected: selected,
        favorite: false,
      ),
    );
  }
}
