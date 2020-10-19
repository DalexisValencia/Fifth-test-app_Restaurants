import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/additional/additionals_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dishAmount/bloc/dishamount_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/sections/Additionals.dart';
import 'package:fith_app__restaurant/sections/AmountDish.dart';
import 'package:fith_app__restaurant/sections/CustomHeader.dart';
import 'package:fith_app__restaurant/sections/SummaryIngredients.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/DishSummary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlateDetailWrapper extends StatefulWidget {
  PlateDetailWrapper();
  @override
  _PlateDetailWrapperState createState() => _PlateDetailWrapperState();
}

class _PlateDetailWrapperState extends State<PlateDetailWrapper> {
  bool minSizeReached = false;
  bool animatedOpacity = true;
  bool animationChildren = true;
  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    this.startAnimationScreen();
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

  _changeStatusBarThemeColor(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  _scrollListener() {
    if (_controller.offset > 100 && !minSizeReached) {
      setState(() {
        minSizeReached = true;
      });
      _changeStatusBarThemeColor(SystemUiOverlayStyle.dark);
    }
    if (_controller.offset < 100 && minSizeReached) {
      setState(() {
        minSizeReached = false;
      });
      _changeStatusBarThemeColor(SystemUiOverlayStyle.light);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<DishBloc, DishState>(
      builder: (context, state) {
        Dishes dish = state.props[0];
        return AnimatedOpacity(
            duration: Duration(milliseconds: animationOpacityTime),
            opacity: animatedOpacity ? 0 : 1,
            child: CustomContainerAnimation(
                animationChildren: animationChildren,
                children: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider<AdditionalsBloc>(
                        create: (BuildContext context) => AdditionalsBloc(),
                      ),
                      BlocProvider<DishamountBloc>(
                        create: (BuildContext context) => DishamountBloc(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: SingleChildScrollView(
                                    controller: _controller,
                                    child: Column(
                                      children: <Widget>[
                                        DishPortrait(image: dish.image),
                                        DishFeatures(dish: dish),
                                        // BlocProvider(
                                        //   create: (BuildContext context) =>
                                        //       DishamountBloc(),
                                        //   child:
                                        AmountDishes(
                                            amount: dish.amount,
                                            price: dish.price,
                                            promos: dish.pricePromotions),
                                        // ),
                                        dish.additions.length >= 1
                                            ? Aditionals(
                                                aditionals: dish.additions)
                                            // BlocProvider(
                                            //     create:
                                            //         (BuildContext context) =>
                                            //             AdditionalsBloc(),
                                            //     child: Aditionals(
                                            //         aditionals: dish.additions))
                                            : SizedBox(
                                                height: 0,
                                                width: 0,
                                              ),
                                        SummaryIngredients(
                                            ingredients: dish.ingredients),
                                        DishSummary(),
                                        SizedBox(
                                          height: 80,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: AnimatedContainer(
                              decoration: BoxDecoration(
                                  color: minSizeReached
                                      ? Colors.white
                                      : Colors.transparent,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.5,
                                        color: minSizeReached
                                            ? Theme.of(context).primaryColor
                                            : Colors.transparent,
                                        offset: Offset(2, 0))
                                  ]),
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top + 10,
                                  bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: CustomHeader(
                                iconColors: minSizeReached
                                    ? Theme.of(context).primaryColorDark
                                    : Theme.of(context).primaryColorLight,
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child: SizedBox.expand(
                                  child: AddtoCar(dish: dish),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                // )
                )
            //
            );
      },
    )
        //
        );
  }
}

//Imagen principal del plato
class DishPortrait extends StatelessWidget {
  final String image;
  DishPortrait({this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: ExactAssetImage(image))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
    );
  }
}

//Especificaciones del plato. Icono - Nombre - Descripción y calificaciones
class DishFeatures extends StatelessWidget {
  final Dishes dish;
  DishFeatures({this.dish});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).buttonColor,
            ),
            child: Icon(
              Icons.restaurant_menu,
              size: 30,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.07,
                0,
                MediaQuery.of(context).size.width * 0.07,
                0),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Center(
              child: Text(
                dish.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            child: Text(
              "\$${dish.price}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                right: MediaQuery.of(context).size.width * 0.07),
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.008),
            // color: Colors.white,
            child: Text(
              dish.details,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.012),
            child: Builder(
              builder: (BuildContext context) {
                int rating = dish.rating.toInt();
                List repeat = new List(5);
                List<Widget> stars = [];
                repeat.asMap().entries.map((e) {
                  int index = (e.key + 1);
                  if (index <= rating) {
                    stars.add(
                      Icon(
                        Icons.star,
                        size: 22,
                        color: Theme.of(context).buttonColor,
                      ),
                    );
                  }
                  if (index > rating) {
                    stars.add(
                      Icon(
                        Icons.star,
                        size: 22,
                        color: Theme.of(context).accentColor,
                      ),
                    );
                  }
                }).toList();

                stars.add(
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      '120.000 votes',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                );
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: stars,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddtoCar extends StatefulWidget {
  final Dishes dish;
  AddtoCar({this.dish});
  @override
  _AddtoCarState createState() => _AddtoCarState();
}

class _AddtoCarState extends State<AddtoCar> {
  String finalPrice(amount) {
    //
    List<PricePromotions> specialPrice;
    if (widget.dish.pricePromotions.length >= 1) {
      specialPrice = widget.dish.pricePromotions.where((element) {
        PricePromotions promos = element;
        return promos.amount == amount;
      }).toList();
    }
    return specialPrice == null
        ? formatterPrice(widget.dish.price * amount).toString()
        : specialPrice.length >= 1
            ? formatterPrice(specialPrice[0].price).toString()
            : formatterPrice((widget.dish.price * amount)).toString();
  }

  @override
  Widget build(BuildContext context) {
    // final AdditionalsBloc additionalsBloc =
    //     BlocProvider.of<AdditionalsBloc>(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Theme.of(context).accentColor, width: 1)),
        color: Theme.of(context).primaryColorLight,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * defaultPadding),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: BlocBuilder<DishamountBloc, DishamountState>(
                builder: (BuildContext context, DishamountState state) {
                  return Text(
                    "\$${finalPrice(state.props[0])}",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 22,
                        color: Theme.of(context).buttonColor,
                        fontWeight: FontWeight.w900),
                  );
                },
              )),
          Spacer(),
          SizedBox(
              height: 41,
              width: 120,
              child: BlocBuilder<DishamountBloc, DishamountState>(
                  builder: (BuildContext context, DishamountState state) {
                return RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    print(widget.dish);
                    print(BlocProvider.of<DishamountBloc>(context)
                        .state
                        .props[0]);
                    print(BlocProvider.of<AdditionalsBloc>(context)
                        .state
                        .props[0]);
                  },
                  elevation: 0,
                  icon: Icon(
                    Icons.add_shopping_cart,
                    size: 18,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  label: Text(
                    "Añadir",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Theme.of(context).primaryColorLight),
                  ),
                );
              }))
        ],
      ),
    );
  }
}
