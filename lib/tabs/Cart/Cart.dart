import 'dart:async';

import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/tabs/Cart/components/Empty/Empty.dart';
import 'package:restaurants/tabs/Cart/components/List/List__verticalList.dart';
import 'package:restaurants/tabs/Cart/components/cart__buttonPay.dart';
import 'package:restaurants/widgets/Navigation/navigation.dart';
import 'package:restaurants/widgets/Screen__heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCart extends StatefulWidget {
  final TabController? controller;
  ScreenCart({
    Key? key,
    this.controller,
  }) : super(key: key);
  @override
  _ScreenCartState createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  List<int> deleteFromCard = [];
  late CartBloc cartBloc;

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
          List<Dishes> cartDishes = state.props[0] as List<Dishes>;
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
                goBack: () {
                  widget.controller!.animateTo(0);
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
