import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/additional/additionals_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dishAmount/bloc/dishamount_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddtoCar extends StatefulWidget {
  final Dishes dish;
  AddtoCar({
    this.dish,
  });
  @override
  _AddtoCarState createState() => _AddtoCarState();
}

class _AddtoCarState extends State<AddtoCar> {
  bool _addingCar = false;
  CartBloc cartbloc;

  @override
  initState() {
    super.initState();
    cartbloc = BlocProvider.of<CartBloc>(context);
  }

  String finalPrice(amount, additionals) {
    List<PricePromotions> specialPrice;
    List<PricePromotions> promotionsPrices =
        widget.dish.promotionLabel.pricePromotions;
    if (promotionsPrices.length >= 1) {
      specialPrice = promotionsPrices.where((element) {
        PricePromotions promos = element;
        return promos.amount == amount;
      }).toList();
    }
    return specialPrice == null
        ? formatterPrice((widget.dish.price * amount) + additionals).toString()
        : specialPrice.length >= 1
            ? formatterPrice((specialPrice[0].price) + additionals).toString()
            : formatterPrice((widget.dish.price * amount) + additionals)
                .toString();
  }

  void addToCart(Dishes detailDish) {
    cartbloc.add(
      AddToCart(
        dish: widget.dish,
      ),
    );
    setState(() {
      _addingCar = true;
    });
    Timer(Duration(seconds: 2), () {
      setState(() {
        _addingCar = false;
      });
      snackBarAddCart(
        context,
        widget.dish.name,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).accentColor,
            width: 1,
          ),
        ),
        color: Theme.of(context).buttonColor,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * defaultPadding,
      ),
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<DishamountBloc, DishamountState>(
        builder: (BuildContext context, DishamountState stateAmount) {
          return Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: BlocBuilder<AdditionalsBloc, AdditionalsState>(
                  builder: (BuildContext context, AdditionalsState state) {
                    return Text(
                      "\$${finalPrice(stateAmount.props[0], state.props[1])}",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 22,
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.w900,
                          ),
                    );
                  },
                ),
              ),
              Spacer(),
              SizedBox(
                height: 41,
                width: 120,
                child: RaisedButton.icon(
                  color: Theme.of(context).primaryColorLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: _addingCar
                      ? null
                      : () {
                          widget.dish.amount = stateAmount.props[0];
                          addToCart(widget.dish);
                        },
                  elevation: 0,
                  icon: _addingCar
                      ? SizedBox()
                      : Icon(
                          Icons.add_shopping_cart,
                          size: 18,
                          color: Theme.of(context).buttonColor,
                        ),
                  label: _addingCar
                      ? Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColorLight,
                            ),
                          ),
                        )
                      : Text(
                          "Añadir",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Theme.of(context).buttonColor,
                              ),
                        ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
