import 'dart:async';

import 'package:restaurants/blocs/bloc/additional/additionals_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/dishAmount/bloc/dishamount_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/screens/DishDetail/dishDetail__addToCar.dart';
import 'package:restaurants/screens/DishDetail/components/additionals/dishDetail__additionals.dart';
import 'package:restaurants/screens/DishDetail/dishDetail__amount.dart';
import 'package:restaurants/screens/DishDetail/dishDetail__summary.dart';
import 'package:restaurants/screens/DishDetail/dishDetail__feaures.dart';
import 'package:restaurants/screens/DishDetail/dishDetail__header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/screens/DishDetail/dishDetail__ingredients.dart';
import 'package:restaurants/screens/DishDetail/dishDetail__portrait.dart';

class PlateDetailScreen extends StatefulWidget {
  final Dishes? dish;
  PlateDetailScreen({
    Key? key,
    this.dish,
  }) : super(key: key);
  @override
  _PlateDetailScreenState createState() => _PlateDetailScreenState();
}

class _PlateDetailScreenState extends State<PlateDetailScreen> {
  bool minSizeReached = false;
  bool animatedOpacity = true;
  late DishBloc instanceDishBloc;
  bool animationChildren = true;
  late ScrollController _controller;
  _scrollListener() {
    if (_controller.offset > 100 && !minSizeReached) {
      setState(() {
        minSizeReached = true;
      });
      // _changeStatusBarThemeColor(SystemUiOverlayStyle.dark);
    }
    if (_controller.offset < 100 && minSizeReached) {
      setState(() {
        minSizeReached = false;
      });
      //_changeStatusBarThemeColor(SystemUiOverlayStyle.light);
    }
  }

  void startAnimationScreen() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        animatedOpacity = false;
      });
    });
    startAnimationChildren();
  }

  void startAnimationChildren() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        animationChildren = false;
      });
    });
  }

  // Registramos el plato apenas entramos a la vista
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    instanceDishBloc = BlocProvider.of<DishBloc>(context)
      ..add(
        DishStart(
          currentDish: widget.dish,
        ),
      )
      ..stream.listen((state) {
        if (state is DishCurrent) {
          startAnimationScreen();
        }
      });
  }

  //Cuando avandonamos la vista volvemos al estado de plato vacio
  @override
  void dispose() {
    super.dispose();
    instanceDishBloc.add(
      DishClean(),
    );
  }

  Widget _loaderSpinner() {
    return Expanded(
      child: Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).buttonColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _plateDetailBody(DishState state) {
    Dishes dish = state.props[0] as Dishes;
    return Expanded(
      child: AnimatedOpacity(
        opacity: !animatedOpacity ? 1 : 0,
        duration: Duration(
          milliseconds: 500,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AdditionalsBloc>(
                create: (BuildContext context) => AdditionalsBloc(),
              ),
              BlocProvider<DishamountBloc>(
                create: (BuildContext context) => DishamountBloc(),
              )
            ],
            child: Stack(
              children: [
                Container(
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: Column(
                      children: [
                        DishPortrait(
                          image: dish.image,
                        ),
                        DetailFeatures(
                          dish: dish,
                        ),
                        AmountDishes(
                          amount: dish.amount,
                          price: dish.price,
                          promos: dish.promotionLabel!.pricePromotions,
                        ),
                        dish.additions!.isNotEmpty
                            ? Aditionals(
                                aditionals: dish.additions!,
                              )
                            : SizedBox(
                                height: 0,
                                width: 0,
                              ),
                        SummaryIngredients(
                          ingredients: dish.ingredients,
                        ),
                        DishSummary(),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                // here header
                DishDetailHeader(
                  dish: dish,
                  minSizeReached: minSizeReached,
                ),
                AddtoCar(
                  dish: dish,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: BlocBuilder<DishBloc, DishState>(
        builder: (BuildContext context, DishState state) {
          return Container(
            child: Column(
              children: [
                state is DishEmpty ? _loaderSpinner() : _plateDetailBody(state),
              ],
            ),
          );
        },
      ),
    );
  }
}
