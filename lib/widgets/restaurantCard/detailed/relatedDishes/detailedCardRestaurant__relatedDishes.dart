import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/sections/Screen__EmtpySection.dart';
import 'package:restaurants/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/widgets/dishCard/normal/dishCard.dart';
import 'package:restaurants/widgets/restaurantCard/detailed/relatedDishes/detailedCardRestaurant__separator.dart';
import 'package:restaurants/widgets/restaurantCard/detailed/detailedCardRestaurant__cardRestaurant.dart';
// import 'package:restaurants/widgets/restaurantCard/detailed/relatedDishes/detailedCardRestaurant__relatedDishes--body.dart';

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
                  child: Container(
                    // color: Colors.red,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.025,
                    ),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.07,
                      top: MediaQuery.of(context).size.width * 0.02,
                      left: MediaQuery.of(context).size.width * defaultPadding,
                    ),
                    child: Builder(
                      builder: (BuildContext context) {
                        List<Widget> nextTops = [];
                        widget.restaurant!.menu!.map((e) {
                          nextTops.add(
                            DishCard(
                              dish: e,
                            ),
                          );
                        }).toList();
                        return Column(
                          children: nextTops,
                        );
                      },
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * defaultPadding,
                  ),
                  child: EmptySections(),
                ),
          DetailedCardRestaurantSeparator(),
        ],
      ),
    );
  }
}
