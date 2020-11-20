import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/sections/AppBarCustom.dart';
import 'package:fith_app__restaurant/widgets/ButtonsInHeader.dart';
import 'package:fith_app__restaurant/widgets/ScreenTitle.dart';
import 'package:flutter/material.dart';

class ScreenCart extends StatefulWidget {
  @override
  _ScreenCartState createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
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
          amout: 0,
        ),
        // iconLeft: ArrowBackHeaderButton(),
        // iconRigth: TrashFavoriteHeaderButton(
        //   amout: forDelete.length,
        // ),
      ),
    );
  }

  Widget _screenTitle() {
    return ScreenTitle(
      title: 'Cart',
      subtitle: '', //there are no items
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
              EmptyCart(),
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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
