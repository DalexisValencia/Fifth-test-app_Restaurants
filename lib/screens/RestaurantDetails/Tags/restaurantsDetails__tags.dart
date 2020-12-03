import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/screens/RestaurantDetails/Tags/components/tags__item.dart';
import 'package:fith_app__restaurant/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:flutter/material.dart';

class ExploreTheMenu extends StatefulWidget {
  final List<String> tags;
  final String restaurantName;
  ExploreTheMenu({
    this.tags,
    this.restaurantName,
  });
  @override
  _ExploreTheMenuState createState() => _ExploreTheMenuState();
}

class _ExploreTheMenuState extends State<ExploreTheMenu> {
  Widget _chipsAsMenu() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * defaultPadding,
      ),
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> chips = [];
          widget.tags.map((e) {
            chips.add(
              TagItem(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // _header(),
          SeeAllSuggested(
            title: 'Explore the Menu',
          ),
          _chipsAsMenu(),
        ],
      ),
    );
  }
}
