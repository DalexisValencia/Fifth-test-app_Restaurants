//Componente utilizado para armar la tarjeta de carrito cuando tiene modificadores
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/widgets/CustomChip.dart';
import 'package:flutter/material.dart';

class CompleteCartItem extends StatelessWidget {
  final int indexTest;
  CompleteCartItem({Key key, this.indexTest}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Column(
        children: [
          ItemCart(
            withModifiers: indexTest == 0 || indexTest == 1 ? true : false,
          ),
          indexTest == 0 || indexTest == 1
              ? ExpansionModifiersCartItem()
              : SizedBox(),
        ],
      ),
    );
  }
}

class ItemCart extends StatelessWidget {
  final bool withModifiers;
  ItemCart({Key key, this.withModifiers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * defaultPadding,
          // vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: !withModifiers
              ? BorderRadius.circular(borderRadiusCards)
              : BorderRadius.only(
                  topLeft: Radius.circular(borderRadiusCards),
                  topRight: Radius.circular(borderRadiusCards),
                ),
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

class ExpansionModifiersCartItem extends StatefulWidget {
  @override
  _ExpansionModifiersCartItemState createState() =>
      _ExpansionModifiersCartItemState();
}

class _ExpansionModifiersCartItemState
    extends State<ExpansionModifiersCartItem> {
  bool showModifiers = false;
  void activeModifiers() {
    setState(() {
      showModifiers = !showModifiers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              activeModifiers();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * defaultPadding,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: showModifiers
                    ? BorderRadius.circular(0)
                    : BorderRadius.only(
                        bottomLeft: Radius.circular(borderRadiusCards),
                        bottomRight: Radius.circular(borderRadiusCards),
                      ),
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Modificadores",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Icon(
                    showModifiers
                        ? Icons.arrow_drop_up_rounded
                        : Icons.arrow_drop_down_rounded,
                    color: Theme.of(context).primaryColorLight,
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: showModifiers,
            child: AnimatedOpacity(
              opacity: !showModifiers ? 0 : 1,
              duration: Duration(
                milliseconds: animationOpacityTime,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal:
                      MediaQuery.of(context).size.width * defaultPadding,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  border: Border.all(
                    color: Theme.of(context).primaryColorDark.withOpacity(0.4),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cubiertos",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Theme.of(context).primaryColorDark,
                                ),
                          ),
                          Text(
                            "si",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Theme.of(context).primaryColorDark,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bebida",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Theme.of(context).primaryColorDark,
                                ),
                          ),
                          Text(
                            "15.000",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Theme.of(context).primaryColorDark,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
