import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/Animation__amountOnGlobe.dart';

class TabsBottomNavItemCar extends StatelessWidget {
  const TabsBottomNavItemCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 20,
              ),
              Text(
                "Car",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        Positioned(
          top: 4,
          left: 16,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (BuildContext context, CartState state) {
              List<Dishes> inCart = state.props[0] as List<Dishes>;
              int amountInCart = state.props[2] as int;
              return inCart.length == 0
                  ? SizedBox()
                  : Container(
                      width: 16,
                      height: 16,
                      child: AnimationAmountGlobeCart(
                        amout: amountInCart,
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}
