import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:fith_app__restaurant/widgets/Suggested__card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fith_app__restaurant/screens/seemoreDishesInRestaurant.dart';

class CardCategorySuggested extends StatefulWidget {
  final List<Dishes> suggestions;
  CardCategorySuggested({this.suggestions});
  @override
  CardCategorySuggestedState createState() => CardCategorySuggestedState();
}

class CardCategorySuggestedState extends State<CardCategorySuggested> {
  DetailsrestaurantBloc instancerestaurantBloc;
  @override
  void initState() {
    super.initState();
    instancerestaurantBloc = BlocProvider.of<DetailsrestaurantBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      margin: EdgeInsets.only(top: totalWidth * 0.05),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: withDefaultPadding),
            child: FullSectionTitle(
              title: 'Suggestions',
              rightContainer: RoundedCustomButton(
                  title: 'See all',
                  callPressed: () {
                    customAnimateNavigation(
                        context,
                        BlocProvider.value(
                          value: instancerestaurantBloc,
                          child: SeeMoreDishesByRestaurant(
                            searchKey: 'suggestions',
                          ),
                        ));
                  }),
            ),
          ),
          WrapperSuggestions(suggestions: widget.suggestions)
        ],
      ),
    );
  }
}

class WrapperSuggestions extends StatefulWidget {
  final List<Dishes> suggestions;
  WrapperSuggestions({this.suggestions});
  @override
  _WrapperSuggestionsState createState() => _WrapperSuggestionsState();
}

class _WrapperSuggestionsState extends State<WrapperSuggestions> {
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
        margin: EdgeInsets.only(left: withDefaultPadding),
        width: totalWidth,
        height: totalHeight * 0.25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.suggestions.length,
          itemBuilder: (BuildContext context, int index) {
            return SuggestionCard(
              suggestion: widget.suggestions[index],
            );
            // return Text("Info");
          },
        ),
      ),
    );
  }
}
