import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/widgets/chip/category/categoryChip.dart';
import 'package:restaurants/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:flutter/material.dart';

class RestaurantdetailCategories extends StatefulWidget {
  final List<String>? tags;
  final String? restaurantName;
  RestaurantdetailCategories({
    this.tags,
    this.restaurantName,
  });
  @override
  _RestaurantdetailCategoriesState createState() =>
      _RestaurantdetailCategoriesState();
}

class _RestaurantdetailCategoriesState
    extends State<RestaurantdetailCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // _header(),
          SeeAllSuggested(
            title: 'Explore the Menu',
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * defaultPadding,
            ),
            child: Builder(
              builder: (BuildContext context) {
                List<Widget> chips = [];
                widget.tags!.map((e) {
                  chips.add(
                    CategoryChip(
                      name: e,
                    ),
                  );
                }).toList();
                return Wrap(
                  runSpacing: -8,
                  spacing: 5,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: chips,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
