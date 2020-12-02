import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/additional/additionals_bloc.dart';
// import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dishAmount/bloc/dishamount_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/tabs/DishDetail/components/dishDetail__addButton.dart';
import 'package:fith_app__restaurant/tabs/DishDetail/components/dishDetail__feaures.dart';
import 'package:fith_app__restaurant/tabs/DishDetail/components/dishDetail__portrait.dart';
import 'package:fith_app__restaurant/tabs/DishDetail/components/additionals/dishDetail__additionals.dart';
import 'package:fith_app__restaurant/sections/AmountDish.dart';
import 'package:fith_app__restaurant/sections/CustomHeader.dart';
import 'package:fith_app__restaurant/tabs/DishDetail/components/dishDetail__ingredients.dart';
// import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/tabs/DishDetail/components/dishDetail__dishSummary.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// PlateDetailWrapper
class PlateDetailScreen extends StatefulWidget {
  final Dishes dish;
  PlateDetailScreen({
    Key key,
    this.dish,
  }) : super(key: key);
  @override
  _PlateDetailScreenState createState() => _PlateDetailScreenState();
}

class _PlateDetailScreenState extends State<PlateDetailScreen> {
  bool minSizeReached = false;
  bool animatedOpacity = true;
  DishBloc instanceDishBloc;
  bool animationChildren = true;
  ScrollController _controller;
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
      ..listen((state) {
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
    Dishes dish = state.props[0];
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
                          promos: dish.promotionLabel.pricePromotions,
                        ),
                        dish.additions.isNotEmpty
                            ? Aditionals(
                                aditionals: dish.additions,
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
                Positioned(
                  top: 0,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      color: minSizeReached ? Colors.white : Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.5,
                          color: minSizeReached
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                          offset: Offset(2, 0),
                        )
                      ],
                    ),
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.ease,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 10,
                      bottom: 10,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: CustomHeader(
                      firstAction: 'goBack',
                      secondAction: 'favorite',
                      iconColors: minSizeReached
                          ? Theme.of(context).primaryColorDark
                          : Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: Colors.red,
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: SizedBox.expand(
                        child: AddtoCar(
                          dish: dish,
                        ),
                      ),
                    ),
                  ),
                )
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
