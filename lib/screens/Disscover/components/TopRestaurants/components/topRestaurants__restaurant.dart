import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/screens/Disscover/components/TopRestaurants/components/topRestaurant__separatorLine.dart';
import 'package:fith_app__restaurant/screens/Disscover/components/TopRestaurants/components/topRestaurants__relatedDishes.dart';
import 'package:fith_app__restaurant/screens/Disscover/components/TopRestaurants/components/topRestaurants__cardRestaurant.dart';
import 'package:fith_app__restaurant/sections/Screen__EmtpySection.dart';
import 'package:fith_app__restaurant/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainTopRestaurant extends StatefulWidget {
  final Restaurants? restaurant;
  MainTopRestaurant({
    this.restaurant,
  });
  @override
  _MainTopRestaurantState createState() => _MainTopRestaurantState();
}

class _MainTopRestaurantState extends State<MainTopRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          RestaurantTopSummary(
            resturant: widget.restaurant,
          ),
          SeeAllSuggested(
            title: "${widget.restaurant!.name}'s Menu",
          ),
          widget.restaurant!.menu!.length >= 1
              ? BlocProvider(
                  create: (BuildContext context) => DishBloc(),
                  child: RelatedDishesTopRestaurant(
                    menu: widget.restaurant!.menu!,
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * defaultPadding,
                  ),
                  child: EmptySections(),
                ),
          SeparatorLine(),
        ],
      ),
    );
  }
}
