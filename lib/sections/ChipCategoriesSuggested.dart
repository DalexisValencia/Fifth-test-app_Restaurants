import 'package:fith_app__restaurant/interfaces/categories.dart';
import 'package:flutter/material.dart';

class RelatedCategories extends StatefulWidget {
  @override
  RelatedCategoriesState createState() => RelatedCategoriesState();
}

class RelatedCategoriesState extends State<RelatedCategories> {
  List<Category> _suggesteds = [
    Category(name: 'Cofee', icon: Icons.free_breakfast, iconSource: ''),
    Category(name: 'Burgers', icon: Icons.fastfood, iconSource: ''),
    Category(name: 'Meat', icon: Icons.restaurant, iconSource: ''),
    Category(name: 'Salad', icon: Icons.local_dining, iconSource: ''),
    Category(name: 'Sweets', icon: Icons.group_work, iconSource: ''),
    Category(name: 'Beer', icon: Icons.local_bar, iconSource: ''),
    Category(name: 'Cake', icon: Icons.cake, iconSource: ''),
    Category(name: 'Pizza', icon: Icons.local_pizza, iconSource: '')
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _suggesteds.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: EdgeInsets.only(right: 10),
            child: ActionChip(
                backgroundColor: Theme.of(context).highlightColor,
                // clipBehavior: Clip.antiAlias,
                elevation: 0.2,
                onPressed: () {},
                avatar: CircleAvatar(
                  backgroundColor: Color(0x00000000),
                  child: Icon(_suggesteds[index].icon,
                      size: 20, color: Theme.of(context).primaryColor),
                ),
                label: Text(
                  _suggesteds[index].name,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                )));
      },
    );
  }
}
