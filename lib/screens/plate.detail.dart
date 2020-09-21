import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
import 'package:fith_app__restaurant/interfaces/summaryStep.dart';
import 'package:fith_app__restaurant/widgets/AditionalsExpansions.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlateDetailWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<DishBloc, DishState>(
        builder: (BuildContext context, state) {
      print(state.props);
      return Text('La info');
    }));
  }
}
// class PlateDetailWrapper extends StatefulWidget {
//   @override
//   _PlateDetailWrapperState createState() => _PlateDetailWrapperState();
// }

// class _PlateDetailWrapperState extends State<PlateDetailWrapper> {
//   bool minSizeReached = false;
//   bool animatedOpacity = true;
//   bool animationChildren = true;

//   ScrollController _controller;
//   @override
//   void initState() {
//     _controller = ScrollController();
//     _controller.addListener(_scrollListener);
//     super.initState();
//     this.startAnimationScreen();
//   }

//   void startAnimationScreen() {
//     Timer(Duration(milliseconds: animationStartTime), () {
//       setState(() {
//         animatedOpacity = false;
//       });
//     });
//     startAnimationChildren();
//   }

//   void startAnimationChildren() {
//     Timer(Duration(milliseconds: animationStartTime), () {
//       setState(() {
//         animationChildren = false;
//       });
//     });
//   }

//   _changeStatusBarThemeColor(SystemUiOverlayStyle style) {
//     SystemChrome.setSystemUIOverlayStyle(style);
//   }

//   _scrollListener() {
//     if (_controller.offset > 100 && !minSizeReached) {
//       setState(() {
//         minSizeReached = true;
//       });
//       _changeStatusBarThemeColor(SystemUiOverlayStyle.dark);
//     }
//     if (_controller.offset < 100 && minSizeReached) {
//       setState(() {
//         minSizeReached = false;
//       });
//       _changeStatusBarThemeColor(SystemUiOverlayStyle.light);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<DishBloc, DishState>(
//           builder: (BuildContext context, state) {
//         return Text('La info');
//       }),
//     );
//     // return Scaffold(
//     //   body: BlocBuilder<DishBloc, DishState>(
//     //       builder: (BuildContext context, state) {
//     //     return Text('La info');
//     //   }),
//     // );
//     // return Scaffold(
//     //     body: AnimatedOpacity(
//     //         duration: Duration(milliseconds: animationOpacityTime),
//     //         opacity: animatedOpacity ? 0 : 1,
//     //         child: CustomContainerAnimation(
//     //           animationChildren: animationChildren,
//     //           children: BlocBuilder<DishBloc, DishState>(
//     //               builder: (BuildContext context, state) {
//     //             print(state);
//     //             // Dishes dish = state.props[0];
//     //             return Container(
//     //               width: MediaQuery.of(context).size.width,
//     //               height: MediaQuery.of(context).size.height,
//     //               child: Stack(
//     //                 children: <Widget>[
//     //                   Container(
//     //                     width: MediaQuery.of(context).size.width,
//     //                     height: MediaQuery.of(context).size.height,
//     //                     child: Column(
//     //                       children: <Widget>[
//     //                         Expanded(
//     //                           child: Container(
//     //                             width: MediaQuery.of(context).size.width,
//     //                             child: SingleChildScrollView(
//     //                               controller: _controller,
//     //                               child: Column(
//     //                                 children: <Widget>[
//     //                                   Text("es la info??"),
//     //                                   // HeaderPlateDetails(image: dish.image),
//     //                                   // GroupPlateBasicDetails(dish: dish),
//     //                                   // AmountProduct(
//     //                                   //     price: dish.price,
//     //                                   //     promos: dish.pricePromotions),
//     //                                   // Aditionals(),
//     //                                   // SummaryIngredients(),
//     //                                   // PreparationTime(),
//     //                                   // SizedBox(
//     //                                   //   height: 60,
//     //                                   // ),
//     //                                 ],
//     //                               ),
//     //                             ),
//     //                           ),
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   ),
//     //                   // Positioned(
//     //                   //   top: 0,
//     //                   //   child: AnimatedContainer(
//     //                   //       decoration: BoxDecoration(
//     //                   //           color: minSizeReached
//     //                   //               ? Colors.white
//     //                   //               : Colors.transparent,
//     //                   //           boxShadow: [
//     //                   //             BoxShadow(
//     //                   //                 blurRadius: 0.5,
//     //                   //                 color: minSizeReached
//     //                   //                     ? Theme.of(context).primaryColor
//     //                   //                     : Colors.transparent,
//     //                   //                 offset: Offset(2, 0))
//     //                   //           ]),
//     //                   //       duration: Duration(milliseconds: 500),
//     //                   //       curve: Curves.ease,
//     //                   //       padding: EdgeInsets.only(
//     //                   //           top:
//     //                   //               MediaQuery.of(context).padding.top + 10,
//     //                   //           bottom: 10),
//     //                   //       width: MediaQuery.of(context).size.width,
//     //                   //       child: StackTopHeader(
//     //                   //         iconColors: minSizeReached
//     //                   //             ? Theme.of(context).primaryColorDark
//     //                   //             : Theme.of(context).primaryColorLight,
//     //                   //       )),
//     //                   // ),
//     //                   // Positioned(
//     //                   //   bottom: 0,
//     //                   //   child: Container(
//     //                   //     width: MediaQuery.of(context).size.width,
//     //                   //     child: Container(
//     //                   //         margin: EdgeInsets.all(0),
//     //                   //         padding: EdgeInsets.all(0),
//     //                   //         width: MediaQuery.of(context).size.width,
//     //                   //         height: 50,
//     //                   //         child: SizedBox.expand(
//     //                   //           child: AddtoCar(),
//     //                   //         )),
//     //                   //   ),
//     //                   // )
//     //                 ],
//     //               ),
//     //             );
//     //           }),
//     //           // )
//     //         )
//     //         //
//     //         )
//     //     //
//     //     );
//   }
// }

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
    List<Adittional> aditionals = [
      Adittional(title: 'Cubiertos', isMulti: false, children: [
        AditionalsOptions(name: 'Con Cubiertos', isActive: true),
        AditionalsOptions(name: 'Con Palillos chinos', isActive: false)
      ]),
      Adittional(title: 'Salsa', isMulti: true, children: [
        AditionalsOptions(name: '... de tomate', isActive: false),
        AditionalsOptions(name: '... terillaki', isActive: false),
        AditionalsOptions(name: '... de guacamole', isActive: false)
      ]),
      Adittional(title: 'Naruto', isMulti: true, children: [
        AditionalsOptions(name: 'Shikamaru', isActive: false),
        AditionalsOptions(name: 'Shouji', isActive: false),
        AditionalsOptions(name: 'Ino', isActive: false),
        AditionalsOptions(name: 'Shikamaru', isActive: false),
        AditionalsOptions(name: 'Shouji', isActive: false),
        AditionalsOptions(name: 'Ino', isActive: false),
        AditionalsOptions(name: 'Shikamaru', isActive: false),
        AditionalsOptions(name: 'Shouji', isActive: false),
        AditionalsOptions(name: 'Ino', isActive: false)
      ])
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> expandible = [];
          aditionals.map((item) {
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
            'Ingreddients',
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
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _cardIngredients();
          }),
    );
  }

  Widget _cardIngredients() {
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
                  "435G",
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
                  "TOMATTOES",
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
          top: MediaQuery.of(context).size.height * 0.015),
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
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              "Añadir Al Carrito",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Theme.of(context).primaryColorLight),
            ),
          ),
        ));
  }
}

class PreparationTime extends StatefulWidget {
  @override
  _PreparationTimeState createState() => _PreparationTimeState();
}

class _PreparationTimeState extends State<PreparationTime> {
  List<SummaryStepsInterface> listSummmarySteps = [
    SummaryStepsInterface(
        title: 'Preparation time for plates',
        subTitle: '50 minutes',
        icon: Icons.access_time),
    SummaryStepsInterface(
        title: 'Preparation time for # plates',
        subTitle: '50 minutes',
        icon: Icons.access_time),
    SummaryStepsInterface(
        title: '# Plates', subTitle: '\$150.000', icon: Icons.attach_money),
    SummaryStepsInterface(
        title: 'Aditionals', subTitle: '\$13.000', icon: Icons.attach_money),
    SummaryStepsInterface(
        title: 'TOTAL',
        subTitle: '\$150.000 + \$13.000',
        icon: Icons.attach_money)
  ];
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

  Widget summaryContainer(title, subtitle, icon, withBorderBottom) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context)
                      .primaryColor
                      .withOpacity(withBorderBottom ? 0 : 0.3)))),
      child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: SizedBox(
            height: 50,
            width: 50,
            child: Container(
              child: Center(
                child: Icon(
                  icon,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          title: Container(
            transform: Matrix4.translationValues(-10, 0, 0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          subtitle: Container(
            transform: Matrix4.translationValues(-10, 0, 0),
            child: Text(subtitle,
                style: Theme.of(context).textTheme.caption.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                    fontWeight: FontWeight.w500)),
          )),
    );
  }

  Widget _buildSummarySteps() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> _summarySteps = [];
          listSummmarySteps.asMap().entries.map((item) {
            int idx = item.key;
            bool noBorderBottom = (idx + 1) == listSummmarySteps.length;
            SummaryStepsInterface val = item.value;
            _summarySteps.add(summaryContainer(
                val.title, val.subTitle, val.icon, noBorderBottom));
          }).toList();
          return Column(
            children: _summarySteps,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _header(),
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.3))),
          child: _buildSummarySteps(),
        )
      ],
    );
  }
}
