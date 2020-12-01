import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/sections/CardProductWithComments.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestedPopular extends StatelessWidget {
  final List<Dishes> popularSuggestions;
  SuggestedPopular({
    this.popularSuggestions,
  });
  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * defaultPadding,
      ),
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: withDefaultPadding),
              child: FullSectionTitle(
                title: 'Popular',
                rightContainer: RoundedCustomButton(
                  title: 'See all',
                  callPressed: () {},
                ),
                paddingRight: false,
              )),
          PopularSuggestions(
            popular: popularSuggestions,
          ),
        ],
      ),
    );
  }
}

class PopularSuggestions extends StatefulWidget {
  final List<Dishes> popular;
  PopularSuggestions({this.popular});
  @override
  _PopularSuggestionsState createState() => _PopularSuggestionsState();
}

class _PopularSuggestionsState extends State<PopularSuggestions> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DishBloc(),
      child: Builder(builder: (BuildContext context) {
        return new Column(
            children: widget.popular
                .map(
                  (item) => new CardProductWithComments(
                    dish: item,
                  ),
                )
                .toList());
      }),
    );
  }
}
