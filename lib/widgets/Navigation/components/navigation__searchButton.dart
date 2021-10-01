import 'package:fith_app__restaurant/widgets/Button_roundWithIcon.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final String? category;
  final Color? iconColor;
  SearchButton({
    this.category,
    this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: CircleIconButton(
        icon: Icons.search,
        color:
            iconColor == null ? Theme.of(context).primaryColorDark : iconColor!,
        bgColor: Theme.of(context).accentColor.withOpacity(0.4),
        trigger: () {
          print('buscar por: $category');
        },
      ),
    );
  }
}
