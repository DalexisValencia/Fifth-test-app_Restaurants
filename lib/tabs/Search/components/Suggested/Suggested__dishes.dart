import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:restaurants/sections/horizontalListSuggestions/Suggested__horizontalList.dart';
import 'package:flutter/material.dart';

class SuggestedDishes extends StatelessWidget {
  final List<Dishes>? suggestions;
  SuggestedDishes({
    this.suggestions,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SeeAllSuggested(
            title: 'Suggested',
          ),
          Container(
            child: SuggestedHorizontalList(
              suggestions: suggestions,
            ),
          ),
        ],
      ),
    );
  }
}
