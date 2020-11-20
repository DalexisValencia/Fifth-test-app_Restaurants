import 'dart:ui';

import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/sections/AppBarCustom.dart';
import 'package:fith_app__restaurant/widgets/ButtonsInHeader.dart';
import 'package:fith_app__restaurant/widgets/CustomChip.dart';
import 'package:fith_app__restaurant/widgets/ScreenTitle.dart';
import 'package:flutter/material.dart';

class ScreenCart extends StatefulWidget {
  @override
  _ScreenCartState createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  List<int> deleteToCard = [];
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

  Widget _screenTitle() {
    return ScreenTitle(
      title: 'Cart',
      subtitle: 'There are 10 items in your cart', //there are no items
    );
  }

  Widget _bodyCart() {
    return Expanded(
      child: Container(
        // color: Colors.blue[50],
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _screenTitle(),
              // EmptyCart(),
              Cart(),
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
      body: Column(
        children: [
          _screenNavigator(),
          _bodyCart(),
        ],
      ),
    );
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
  final List<int> _cartItems = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1];
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> itemsCard = [];
          _cartItems.asMap().entries.map((e) {
            itemsCard.add(
              CompleteCartItem(
                indexTest: e.key,
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

//Componente utilizado para armar la tarjeta de carrito cuando tiene modificadores
class CompleteCartItem extends StatelessWidget {
  final int indexTest;
  CompleteCartItem({Key key, this.indexTest}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ItemCart(),
          indexTest == 0 ? ExpansionModifiersCartItem() : SizedBox(),
        ],
      ),
    );
  }
}

class ItemCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * defaultPadding,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusCards),
          color: Theme.of(context).primaryColorLight,
          border: Border.all(
            color: Theme.of(context).primaryColorDark.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadiusImages),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage("assets/banner/french-food.png"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // decoration: BoxDecoration(
                //   color: Colors.yellow,
                // ),
                height: MediaQuery.of(context).size.width * 0.25,
                margin: EdgeInsets.only(left: 5, right: 5),
                padding: EdgeInsets.fromLTRB(5, 6, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        CustomChip(
                          name: '12 min',
                          nameColor: Theme.of(context).primaryColor,
                          icon: Icons.timer,
                          iconColor: Theme.of(context).primaryColor,
                        ),
                        CustomChip(
                          name: '12.000',
                          nameColor: Theme.of(context).buttonColor,
                          icon: Icons.monetization_on,
                          iconColor: Theme.of(context).buttonColor,
                        ), // assignment_rounded // cuando sea hoy assignment_turned_in
                      ],
                    ),
                    Text(
                      "nombre del producto",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context).primaryColorDark,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                    ),
                    Text(
                      // widget.dish.details.substring(0, 73) +'...',
                      "la descripcion de este producto no debe ser tan grande, es mas sencilla para que quea la descripcion de este producto no debe ser tan grande, es mas sencilla para que quea"
                              .substring(0, 60) +
                          " ... ",
                      style: Theme.of(context).textTheme.overline.copyWith(
                            letterSpacing: 0,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "\$12.000",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: Theme.of(context).buttonColor,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "1.000",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: Theme.of(context).primaryColorDark,
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              // color: Colors.greenAccent,
              width: 35,
              height: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      color: Theme.of(context).buttonColor,
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                      // height: 25,
                      width: 35,
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        "1",
                        style: Theme.of(context).textTheme.button.copyWith(
                              fontSize: 12,
                              color: Theme.of(context).primaryColorDark,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        color: Theme.of(context).buttonColor,
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                        height: 25,
                        width: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpansionModifiersCartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * defaultPadding,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).buttonColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Modificadores",
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child: Column(
          //     children: [
          //       Container(
          //         color: Colors.amber,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text("Cubiertos"),
          //             Text("si"),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         color: Colors.amber,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text("Bebida"),
          //             Text("15.000"),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
