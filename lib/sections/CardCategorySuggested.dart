import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/sections/Suggested__horizontalList.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fith_app__restaurant/tabs/seemoreDishesInRestaurant.dart';

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
                    ),
                  );
                },
              ),
            ),
          ),
          Text("Esto esta muy mal!!!!!")
          // SuggestedHorizontalList(
          //   suggestions: widget.suggestions,
          // )
        ],
      ),
    );
  }
}
