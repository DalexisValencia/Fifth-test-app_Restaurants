import 'package:restaurants/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/widgets/restaurantCard/detailed/relatedDishes/detailedCardRestaurant__relatedDishes.dart';

class TopRestaurants extends StatefulWidget {
  final List<Restaurants>? restaurants;
  TopRestaurants({
    this.restaurants,
  });
  @override
  _TopRestaurantsState createState() => _TopRestaurantsState();
}

class _TopRestaurantsState extends State<TopRestaurants> {
  Widget _body() {
    return BlocProvider(
      create: (BuildContext context) => DetailsrestaurantBloc(),
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> restaurants = [];
          widget.restaurants!.asMap().entries.map((e) {
            restaurants.add(
              MainTopRestaurant(
                restaurant: e.value,
              ),
            );
          }).toList();
          return Column(
            children: restaurants,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SeeAllSuggested(
            title: "Top Retaurants",
          ),
          _body(),
        ],
      ),
    );
  }
}
