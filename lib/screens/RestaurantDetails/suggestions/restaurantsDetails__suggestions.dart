import 'package:restaurants/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/sections/horizontalListSuggestions/Suggested__horizontalList.dart';
import 'package:restaurants/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantDetailsSuggestions extends StatefulWidget {
  final List<Dishes>? suggestions;
  RestaurantDetailsSuggestions({
    this.suggestions,
  });
  @override
  _RestaurantDetailsSuggestionsState createState() =>
      _RestaurantDetailsSuggestionsState();
}

class _RestaurantDetailsSuggestionsState
    extends State<RestaurantDetailsSuggestions> {
  late DetailsrestaurantBloc instancerestaurantBloc;
  @override
  void initState() {
    super.initState();
    instancerestaurantBloc = BlocProvider.of<DetailsrestaurantBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: totalWidth * 0.05),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 0,
            ),
            child: SeeAllSuggested(
              title: 'Suggestions',
            ),
          ),
          SuggestedHorizontalList(
            suggestions: widget.suggestions!,
          )
        ],
      ),
    );
  }
}
