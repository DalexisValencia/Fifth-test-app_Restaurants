import 'package:restaurants/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/widgets/restaurantCard/normal/restaurantCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListCardRestaurant extends StatelessWidget {
  final Restaurants? restaurant;
  final bool? selected;
  FavoriteListCardRestaurant({
    this.restaurant,
    this.selected,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsrestaurantBloc>(
      create: (BuildContext context) => DetailsrestaurantBloc(),
      child: HightlightResturantsCard(
        hightlight: restaurant!,
        selected: selected!,
        favorite: false,
      ),
    );
  }
}
