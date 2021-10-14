import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:restaurants/widgets/dishCard/cardComment/CardComment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestedPopular extends StatefulWidget {
  final List<Dishes>? popularSuggestions;
  SuggestedPopular({
    this.popularSuggestions,
  });
  @override
  _SuggestedPopularState createState() => _SuggestedPopularState();
}

class _SuggestedPopularState extends State<SuggestedPopular> {
  Widget _verticalList() {
    return BlocProvider(
      create: (BuildContext context) => DishBloc(),
      child: Builder(
        builder: (BuildContext context) {
          return new Column(
            children: widget.popularSuggestions!
                .map(
                  (item) => new DishCardComment(
                    dish: item,
                  ),
                  // (item) => new Text(": item,"),
                )
                .toList(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SeeAllSuggested(
            title: 'Popular',
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * defaultPadding,
            ),
            child: _verticalList(),
          )
        ],
      ),
    );
  }
}
