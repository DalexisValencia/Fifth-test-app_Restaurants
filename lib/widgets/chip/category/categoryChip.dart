import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String? name;
  CategoryChip({
    this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ActionChip(
        shadowColor: Colors.red,
        onPressed: () {
          print('termino busqueda: ' + name!);
          // print('Which Restaurant?: ' + widget.restaurantName);
          // print('ir a la lista completa');
        },
        label: Text(
          '$name',
          maxLines: 1,
        ),
      ),
    );
  }
}
