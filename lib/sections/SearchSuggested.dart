import 'dart:async';

import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/search.dart';
import 'package:flutter/material.dart';
import 'package:fith_app__restaurant/sections/CardsHighlightRestaurants.dart';
import 'package:fith_app__restaurant/sections/ChipCategoriesSuggested.dart';
import 'package:fith_app__restaurant/sections/DishSuggestionInSearch.dart';
import 'package:fith_app__restaurant/sections/PopularsSuggested.dart';

class SearchScreen extends StatefulWidget {
  final SearchInitInterface suggestedSearches;
  SearchScreen({this.suggestedSearches});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool loading = true;

  @override
  initState() {
    super.initState();
    Timer(Duration(milliseconds: 200), () {
      setState(() {
        loading = false;
      });
    });
  }

  Widget loadingWidget() {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.40),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).buttonColor,
            strokeWidth: 4,
          ),
        ));
  }

  Widget _bodySearch() {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding = totalWidth * defaultPadding;
    return Column(
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.only(top: totalWidth * 0.03, left: withDefaultPadding),
          width: totalWidth,
          height: 40,
          child: RelatedCategories(),
        ),
        widget.suggestedSearches.suggestions.length >= 1
            ? WrapperSuggestionSearch(
                suggestions: widget.suggestedSearches.suggestions)
            : SizedBox(),
        widget.suggestedSearches.popular.length >= 1
            ? PopularSuggestedWrapper(
                popularSuggestions: widget.suggestedSearches.popular)
            : SizedBox(),
        widget.suggestedSearches.highlightRestaurants.length >= 1
            ? HightlightResturantsWrapper(
                restaurantSuggestions:
                    widget.suggestedSearches.highlightRestaurants)
            : SizedBox(),
        Text("Cuando se busca desde la vista de resurante"),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(loading);
    return Column(
      // children: <Widget>[loadingWidget()],
      children: <Widget>[loading ? loadingWidget() : _bodySearch()],
      // children: <Widget>[_bodySearch()],
    );
  }
}
