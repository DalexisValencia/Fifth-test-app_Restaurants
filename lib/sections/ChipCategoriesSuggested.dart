import 'package:fith_app__restaurant/interfaces/categories.dart';
import 'package:flutter/material.dart';

class RelatedCategories extends StatefulWidget {
  @override
  RelatedCategoriesState createState() => RelatedCategoriesState();
}

class RelatedCategoriesState extends State<RelatedCategories> {
  List<Category> _suggesteds = [
    Category('Cofee', Icons.store_mall_directory),
    Category('Burgers', Icons.store_mall_directory),
    Category('Meat', Icons.store_mall_directory),
    Category('Salad', Icons.store_mall_directory),
    Category('Sweets', Icons.store_mall_directory),
  ];
  @override
   Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _suggesteds.length,
      itemBuilder: (BuildContext context, int index) {
        return  Container(
          margin: EdgeInsets.only(right: 10),
          child: ActionChip(
            elevation: 1,
            onPressed: () {
              print('seleccionar a los wolves');
            },
            avatar: CircleAvatar(
              backgroundColor: Color(0x00000000),
              child: Icon(
                _suggesteds[index].icon,
                size: 20,
                color: Theme.of(context).primaryColor
              ),
            ),
            label: Text(
              _suggesteds[index].name,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600
              ),
            )
          )
        );
        
      },
    );
  }
}