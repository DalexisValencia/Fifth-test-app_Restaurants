import 'package:fith_app__restaurant/blocs/bloc/dishAmount/bloc/dishamount_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';

class AmountDishes extends StatefulWidget {
  final double price;
  final List promos;
  final int amount;
  AmountDishes({this.price, this.promos, this.amount});
  @override
  _AmountDishesState createState() => _AmountDishesState();
}

class _AmountDishesState extends State<AmountDishes> {
  double priceOrigin = 0;
  double price = 0;
  @override
  void initState() {
    super.initState();
    priceOrigin = widget.price;
    price = widget.price;
    BlocProvider.of<DishamountBloc>(context)
        .add(DishInitialAmount(amount: widget.amount));
  }

  void _amountproduct(type, state) {
    if (type == 'add') {
      BlocProvider.of<DishamountBloc>(context).add(DishAmountPlus());
    }
    if (type == 'remove' && state > 1) {
      BlocProvider.of<DishamountBloc>(context).add(DishAmountRemove());
    }
  }

  String _priceDish(amount) {
    List<PricePromotions> specialPrice;
    if (widget.promos.length >= 1) {
      specialPrice = widget.promos.where((element) {
        PricePromotions promos = element;
        return promos.amount == amount;
      }).toList();
    }
    return specialPrice.length >= 1
        ? specialPrice[0].price.toString()
        : (price * amount).toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishamountBloc, DishamountState>(
      builder: (BuildContext context, DishamountState state) {
        // return Text("${state.props[0].toString()}");
        return Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        // "\$${price * state.props[0]}",
                        "\$${_priceDish(state.props[0])}",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Theme.of(context).buttonColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    Container(
                      child: Row(
                        children: <Widget>[
                          MaterialButton(
                            minWidth: 40,
                            elevation: 0,
                            color: Theme.of(context).buttonColor,
                            padding: EdgeInsets.all(0),
                            onPressed: () =>
                                _amountproduct('remove', state.props[0]),
                            child: Text(
                              "-",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorLight,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5))),
                            height: 35,
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                right:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("${state.props[0]}"),
                            ),
                          ),
                          MaterialButton(
                            minWidth: 40,
                            elevation: 0,
                            color: Theme.of(context).buttonColor,
                            padding: EdgeInsets.all(0),
                            onPressed: () =>
                                _amountproduct('add', state.props[0]),
                            child: Text(
                              "+",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// class AmountProduct extends StatefulWidget {
//   final double price;
//   final List promos;
//   AmountProduct({this.price, this.promos});
//   @override
//   _AmountProductState createState() => _AmountProductState();
// }

// class _AmountProductState extends State<AmountProduct> {
//   int amount = 1;
//   double priceOrigin = 0;
//   double price = 0;

//   @override
//   void initState() {
//     super.initState();
//     priceOrigin = widget.price;
//     price = widget.price;
//   }

//   void _amountproduct(type) {
//     if (type == 'add') {
//       setState(() {
//         amount++;
//         price = priceOrigin * amount;
//       });
//     }
//     if (type == 'remove' && amount > 1) {
//       setState(() {
//         amount--;
//         price = priceOrigin * amount;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//           left: MediaQuery.of(context).size.width * 0.07,
//           right: MediaQuery.of(context).size.width * 0.07),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                     child: FittedBox(
//                   fit: BoxFit.scaleDown,
//                   child: Text(
//                     "\$$price",
//                     style: Theme.of(context).textTheme.headline5.copyWith(
//                         color: Theme.of(context).buttonColor,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 )),
//                 Container(
//                   child: Row(
//                     children: <Widget>[
//                       MaterialButton(
//                         minWidth: 40,
//                         elevation: 0,
//                         color: Theme.of(context).buttonColor,
//                         padding: EdgeInsets.all(0),
//                         onPressed: () => _amountproduct('remove'),
//                         child: Text(
//                           "-",
//                           style: Theme.of(context).textTheme.headline6.copyWith(
//                               color: Theme.of(context).primaryColorLight,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Theme.of(context).primaryColorLight,
//                             borderRadius: BorderRadius.circular(2),
//                             border: Border.all(
//                                 color: Theme.of(context)
//                                     .primaryColor
//                                     .withOpacity(0.5))),
//                         height: 35,
//                         padding: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width * 0.05,
//                             right: MediaQuery.of(context).size.width * 0.05),
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: Text("$amount"),
//                         ),
//                       ),
//                       MaterialButton(
//                         minWidth: 40,
//                         elevation: 0,
//                         color: Theme.of(context).buttonColor,
//                         padding: EdgeInsets.all(0),
//                         onPressed: () => _amountproduct('add'),
//                         child: Text(
//                           "+",
//                           style: Theme.of(context).textTheme.headline6.copyWith(
//                               color: Theme.of(context).primaryColorLight,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
