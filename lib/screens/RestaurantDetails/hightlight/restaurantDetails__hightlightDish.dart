import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/dishCard/promotions/promotionalCard.dart';
import 'package:restaurants/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailHighlightProduct extends StatefulWidget {
  final List<Dishes>? highlishDishes;
  DetailHighlightProduct({
    this.highlishDishes,
  });
  @override
  _DetailHighlightProductState createState() => _DetailHighlightProductState();
}

class _DetailHighlightProductState extends State<DetailHighlightProduct> {
  late DetailsrestaurantBloc restaurantBloc;
  @override
  initState() {
    super.initState();
    restaurantBloc = BlocProvider.of<DetailsrestaurantBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.01,
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: SeeAllSuggested(
              title: 'Available for lunch now',
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: withDefaultPadding - 10,
            ),
            child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 2 / 2.030,
                child: Container(
                  child: BlocProvider(
                    create: (BuildContext context) => DishBloc(),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.highlishDishes!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return HighlightRestaurantCard(
                          dish: widget.highlishDishes![index],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
