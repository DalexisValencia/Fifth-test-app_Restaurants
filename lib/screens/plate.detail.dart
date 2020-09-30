import 'dart:async';

// import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
// import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Ingredients.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
// import 'package:fith_app__restaurant/interfaces/summaryStep.dart';
import 'package:fith_app__restaurant/widgets/AditionalsExpansions.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PlateDetailWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: );
//   }
// }
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
                                      HeaderPlateDetails(
                                          image: dish.image == null
                                              ? ''
                                              : dish.image),
                                      GroupPlateBasicDetails(dish: dish),
                                      AmountProduct(
                                          price: dish.price,
                                          promos: dish.pricePromotions),
                                      dish.additions.length >= 1
                                          ? Aditionals(
                                              aditionals: dish.additions)
                                          : SizedBox(
                                              height: 0,
                                              width: 0,
                                            ),
                                      SummaryIngredients(
                                          ingredients: dish.ingredients),
                                      // PreparationTime(),
                                      PreparationSummary(),
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
                            child: StackTopHeader(
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
                                child: AddtoCar(),
                              )),
                        ),
                      )
                    ],
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

class StackTopHeader extends StatefulWidget {
  final Color iconColors;
  StackTopHeader({this.iconColors});
  @override
  _StackTopHeaderState createState() => _StackTopHeaderState();
}

class _StackTopHeaderState extends State<StackTopHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.07),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            child: CircleIconButton(
              icon: Icons.arrow_back,
              color: widget.iconColors,
              bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
              trigger: () {},
            ),
          ),
          Container(
            width: 40,
            height: 40,
            child: CircleIconButton(
              icon: Icons.favorite,
              color: widget.iconColors,
              bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
              trigger: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderPlateDetails extends StatelessWidget {
  final String image;
  HeaderPlateDetails({this.image});
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

class GroupPlateBasicDetails extends StatelessWidget {
  final Dishes dish;
  GroupPlateBasicDetails({this.dish});
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

class Aditionals extends StatefulWidget {
  final List<Adittional> aditionals;
  Aditionals({this.aditionals});
  @override
  AditionalsState createState() => AditionalsState();
}

class AditionalsState extends State<Aditionals> {
  Widget _header() {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.018,
          top: MediaQuery.of(context).size.height * 0.005),
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Aditionals",
        style: Theme.of(context).textTheme.subtitle1.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColorDark),
      ),
    );
  }

  Widget _expansionAdittional() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> expandible = [];
          widget.aditionals.map((item) {
            expandible.add(AditionalExpansionPanel(
                title: item.title,
                isMulti: item.isMulti,
                children: item.children));
          }).toList();

          return Column(
            children: expandible,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.07),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[_header(), _expansionAdittional()],
      ),
    );
  }
}

class AmountProduct extends StatefulWidget {
  final double price;
  final List promos;
  AmountProduct({this.price, this.promos});
  @override
  _AmountProductState createState() => _AmountProductState();
}

class _AmountProductState extends State<AmountProduct> {
  int amount = 1;
  double priceOrigin = 0;
  double price = 0;

  @override
  void initState() {
    super.initState();
    priceOrigin = widget.price;
    price = widget.price;
  }

  void _amountproduct(type) {
    if (type == 'add') {
      setState(() {
        amount++;
        price = priceOrigin * amount;
      });
    }
    if (type == 'remove' && amount > 1) {
      setState(() {
        amount--;
        price = priceOrigin * amount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    // color: Colors.blue,
                    child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "\$$price",
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
                        onPressed: () => _amountproduct('remove'),
                        child: Text(
                          "-",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Theme.of(context).primaryColorLight,
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
                            right: MediaQuery.of(context).size.width * 0.05),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("$amount"),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        elevation: 0,
                        color: Theme.of(context).buttonColor,
                        padding: EdgeInsets.all(0),
                        // shape: CircleBorder(),
                        onPressed: () => _amountproduct('add'),
                        child: Text(
                          "+",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Theme.of(context).primaryColorLight,
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
  }
}

class SummaryIngredients extends StatefulWidget {
  final List<Ingredients> ingredients;
  SummaryIngredients({this.ingredients});
  @override
  _SummaryIngredientsState createState() => _SummaryIngredientsState();
}

class _SummaryIngredientsState extends State<SummaryIngredients> {
  Widget _header() {
    return Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Ingreddients for plate',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark),
          ),
        ));
  }

  Widget _ingredientsList() {
    return Container(
      // color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: ListView.builder(
          itemCount: widget.ingredients.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _cardIngredients(widget.ingredients[index]);
          }),
    );
  }

  Widget _cardIngredients(Ingredients ingredient) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(5)),
        margin:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.010),
        width: (MediaQuery.of(context).size.width / 4) -
            MediaQuery.of(context).size.width * 0.028,
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  ingredient.amountGrams,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColorDark),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  ingredient.name,
                  style: Theme.of(context).textTheme.caption.copyWith(
                      fontSize: 9,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).primaryColorDark),
                ),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.018,
          top: MediaQuery.of(context).size.height * 0.025),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_header(), _ingredientsList()],
      ),
    );
  }
}

class AddtoCar extends StatefulWidget {
  @override
  _AddtoCarState createState() => _AddtoCarState();
}

class _AddtoCarState extends State<AddtoCar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Theme.of(context).accentColor, width: 1)),
        color: Theme.of(context).primaryColorLight,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * defaultPadding),
      width: MediaQuery.of(context).size.width,
      // child: Text("la info")
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              "\$12.000",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 22,
                  color: Theme.of(context).buttonColor,
                  //
                  fontWeight: FontWeight.w900),
            ),
          ),
          Spacer(),
          // Expanded(
          //     flex: 1,
          SizedBox(
              height: 41,
              width: 120,
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
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
                //),
              ))
        ],
      ),
      // SizedBox(
      //   child: RaisedButton(
      //     onPressed: () {},
      //     child: Text(
      //       "Añadir Al Carrito",
      //       style: Theme.of(context)
      //           .textTheme
      //           .bodyText1
      //           .copyWith(color: Theme.of(context).primaryColorLight),
      //     ),
      //   ),
      // )
      //
    );
  }
}

class PreparationSummary extends StatefulWidget {
  @override
  _PreparationSummaryState createState() => _PreparationSummaryState();
}

class _PreparationSummaryState extends State<PreparationSummary> {
  Widget _header() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07,
            bottom: 10),
        child: Text(
          "Summary",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark),
        ));
  }

  Widget _body() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _card('Cooking', '20 min', Icons.watch_later),
          _card('Extra', '\$10.000', Icons.monetization_on),
          _card('Discount', '-\$5.000', Icons.remove_circle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_header(), _body()],
    );
  }

  Widget _card(name, value, icon) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                size: 12,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
