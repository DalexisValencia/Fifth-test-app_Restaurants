import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:flutter/material.dart';

class SeeAllSuggested extends StatelessWidget {
  final String title;
  SeeAllSuggested({
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * defaultPadding,
      ),
      child: FullSectionTitle(
        title: title,
        rightContainer: RoundedCustomButton(
          title: 'See all',
          callPressed: () {
            print("see all " + this.title.toLowerCase());
            // customAnimateNavigation(
            //     context,
            //     BlocProvider.value(
            //       value: instancerestaurantBloc,
            //       child: SeeMoreDishesByRestaurant(
            //           searchKey: 'suggestions'),
            //     ));
          },
        ),
      ),
    );
  }
}
