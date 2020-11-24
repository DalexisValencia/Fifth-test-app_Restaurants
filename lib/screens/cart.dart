import 'dart:ui';

import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/sections/AppBarCustom.dart';
import 'package:fith_app__restaurant/sections/ItemCartCard.dart';
import 'package:fith_app__restaurant/widgets/ButtonsInHeader.dart';
import 'package:fith_app__restaurant/widgets/ScreenTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCart extends StatefulWidget {
  @override
  _ScreenCartState createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  List<int> deleteToCard = [];
  CartBloc cartBloc;

  @override
  initState() {
    super.initState();
    cartBloc = BlocProvider.of<CartBloc>(context);
  }

  void selectItem(e) {
    print('info');
  }

  Widget _screenNavigator() {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      width: MediaQuery.of(context).size.width,
      height: defaultHeaderCustomHeight,
      child: AppBarCustom(
        iconLeft: ArrowBackHeaderButton(),
        iconRigth: TrashFavoriteHeaderButton(
          amout: deleteToCard.length,
          onClick: () {
            if (deleteToCard.length >= 1) {
              print("Eliminar del carrito");
            }
          },
        ),
      ),
    );
  }

  Widget _screenTitle(bool empty, int amount) {
    // List<Dishes> cartDishes = state.props[0];
    return ScreenTitle(
      title: 'Cart',
      subtitle: empty
          ? ''
          : 'There are $amount items in your cart', //there are no items
    );
  }

  Widget _bodyCart(bool empty, List<Dishes> listDishes) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _screenTitle(empty, listDishes.length),
              empty
                  ? EmptyCart()
                  : Cart(
                      cartDishes: listDishes,
                      onSelectThis: (index) {
                        print(index);
                      },
                    ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //
        body: BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        List<Dishes> cartDishes = state.props[0];
        // // print(state.props);
        return Column(
          children: [
            _screenNavigator(),
            _bodyCart(
              state is CartblocInitial || cartDishes.length == 0,
              cartDishes,
            ),
            RaisedButton(
              onPressed: () {
                cartBloc.add(
                  AddToCart(
                    dish: dishes[0],
                  ),
                );
              },
              child: Text("añadir"),
            )
          ],
        );
      },
    ));
  }
}

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
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w500,
                  ),
            )
          ],
        ));
  }
}

class Cart extends StatelessWidget {
  final List<Dishes> cartDishes;
  final Function onSelectThis;
  Cart({
    this.cartDishes,
    this.onSelectThis,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> itemsCard = [];
          cartDishes.asMap().entries.map((item) {
            itemsCard.add(
              GestureDetector(
                onLongPressEnd: (e) {
                  onSelectThis(item.key);
                },
                child: CompleteCartItem(
                  dish: cartDishes[item.key],
                ),
              ),
            );
          }).toList();
          return Column(
            children: itemsCard,
          );
        },
      ),
    );
  }
}
