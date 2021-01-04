import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/tabs/Cart/components/Empty/Empty.dart';
import 'package:fith_app__restaurant/tabs/Cart/components/List/List__verticalList.dart';
import 'package:fith_app__restaurant/tabs/Cart/components/cart__buttonPay.dart';
import 'package:fith_app__restaurant/widgets/Navigation/Navigation.dart';
import 'package:fith_app__restaurant/widgets/Screen__heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCart extends StatefulWidget {
  @override
  _ScreenCartState createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  List<int> deleteFromCard = [];
  CartBloc cartBloc;

  @override
  initState() {
    super.initState();
    cartBloc = BlocProvider.of<CartBloc>(context);
  }

  void selectItem(e) {
    if (!deleteFromCard.contains(e)) {
      setState(() {
        deleteFromCard.add(e);
      });
    } else if (deleteFromCard.contains(e)) {
      setState(() {
        deleteFromCard.remove(e);
      });
    }
  }

  Widget _bodyCart(bool empty, List<Dishes> listDishes) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ScreenHeading(
                title: 'Cart',
                subtitle: empty
                    ? ''
                    : 'There ${listDishes.length == 1 ? 'is' : 'are'} ${listDishes.length} ${listDishes.length == 1 ? 'item' : 'items'} in your cart',
              ),
              empty
                  ? EmptyCart()
                  : CartVerticalList(
                      cartDishes: listDishes,
                      onSelectThis: (index) {
                        selectItem(index);
                      },
                      selecteds: deleteFromCard,
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
          return Column(
            children: [
              Navigation(
                secondItem: 'trash',
                amout: deleteFromCard.length,
                onPressed: () {
                  if (deleteFromCard.length >= 1) {
                    cartBloc.add(
                      DeleteFromCart(
                        toDelete: deleteFromCard,
                      ),
                    );
                    Timer(
                      Duration(
                        milliseconds: 200,
                      ),
                      () {
                        setState(() {
                          deleteFromCard.clear();
                        });
                      },
                    );
                  }
                },
              ),
              _bodyCart(
                state is CartblocInitial || cartDishes.length == 0,
                cartDishes,
              ),
              state is CartblocInitial || cartDishes.length == 0
                  ? SizedBox()
                  : ButtonCart(),
            ],
          );
        },
      ),
    );
  }
}
