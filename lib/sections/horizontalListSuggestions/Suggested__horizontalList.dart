import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/sections/horizontalListSuggestions/Suggested__horizontalList--Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
Encargado de mostrar una sugerencia de platos mediante un slider horizontal.
Usado en:
1. Suggested -> Platos Sugeridos en la sección del busqueda.
2. RestaurantDetailsSuggestions -> Platos Sugeridos en la sección del restarante.
*/

class SuggestedHorizontalList extends StatefulWidget {
  final List<Dishes>? suggestions;
  SuggestedHorizontalList({
    this.suggestions,
  });
  @override
  _SuggestedHorizontalListState createState() =>
      _SuggestedHorizontalListState();
}

class _SuggestedHorizontalListState extends State<SuggestedHorizontalList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return BlocProvider(
      create: (BuildContext context) => DishBloc(),
      child: Container(
        margin: EdgeInsets.only(
          left: withDefaultPadding,
        ),
        width: totalWidth,
        height: totalHeight * 0.25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.suggestions!.length,
          itemBuilder: (BuildContext context, int index) {
            return SuggestionDishCard(
              suggestion: widget.suggestions![index],
            );
          },
        ),
      ),
    );
  }
}
