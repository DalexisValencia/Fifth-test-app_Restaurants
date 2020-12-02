import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final String category;
  SearchButton({this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: CircleIconButton(
        icon: Icons.search,
        color: Theme.of(context).primaryColorDark,
        bgColor: Theme.of(context).accentColor.withOpacity(0.4),
        trigger: () {
          print('buscar por: $category');
        },
      ),
    );
  }
}
