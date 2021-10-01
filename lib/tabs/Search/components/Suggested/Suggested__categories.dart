import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:flutter/material.dart';

class SuggestedCategories extends StatefulWidget {
  @override
  _SuggestedCategoriesState createState() => _SuggestedCategoriesState();
}

class _SuggestedCategoriesState extends State<SuggestedCategories> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: suggesteds.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(right: 10),
          child: ActionChip(
            backgroundColor: Theme.of(context).highlightColor,
            elevation: 0.2,
            onPressed: () {},
            avatar: CircleAvatar(
              backgroundColor: Color(0x00000000),
              child: Icon(
                suggesteds[index].icon,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
            label: Text(
              suggesteds[index].name!,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
