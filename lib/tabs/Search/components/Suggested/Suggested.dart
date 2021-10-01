import 'dart:async';

import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/search.dart';
import 'package:fith_app__restaurant/tabs/Search/components/Suggested/Suggested__categories.dart';
import 'package:fith_app__restaurant/tabs/Search/components/Suggested/Suggested__dishes.dart';
import 'package:fith_app__restaurant/tabs/Search/components/Suggested/Suggested__popular.dart';
import 'package:fith_app__restaurant/tabs/Search/components/Suggested/Suggested__restaurants.dart';
import 'package:fith_app__restaurant/tabs/Search/components/search__loading.dart';
import 'package:flutter/material.dart';

class Suggested extends StatefulWidget {
  final SearchInitInterface? suggestedSearches;
  Suggested({
    this.suggestedSearches,
  });
  @override
  _SuggestedState createState() => _SuggestedState();
}

class _SuggestedState extends State<Suggested> {
  bool loading = true;

  @override
  initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 200),
      () {
        setState(
          () {
            loading = false;
          },
        );
      },
    );
  }

  Widget _bodySearch() {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding = totalWidth * defaultPadding;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: totalWidth * 0.03,
            left: withDefaultPadding,
          ),
          width: totalWidth,
          height: 40,
          child: SuggestedCategories(),
        ),
        widget.suggestedSearches!.suggestions!.length >= 1
            ? SuggestedDishes(
                suggestions: widget.suggestedSearches!.suggestions,
              )
            : SizedBox(),
        widget.suggestedSearches!.popular!.length >= 1
            ? SuggestedPopular(
                popularSuggestions: widget.suggestedSearches!.popular,
              )
            : SizedBox(),
        widget.suggestedSearches!.highlightRestaurants!.length >= 1
            ? SuggestedRestaurants(
                restaurantSuggestions:
                    widget.suggestedSearches!.highlightRestaurants,
              )
            : SizedBox(),
        Text(
          "Cuando se busca desde la vista de resurante",
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        loading ? LoadingSearch() : _bodySearch(),
      ],
    );
  }
}
