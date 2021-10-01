import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5.4,
          ),
          Icon(
            Icons.add_shopping_cart,
            size: 40,
            color: Theme.of(context).primaryColorDark,
          ),
          SizedBox(height: 4),
          Text(
            'Your cart is empty',
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w500,
                ),
          )
        ],
      ),
    );
  }
}
