//Componente utilizado para armar la tarjeta de carrito cuando tiene modificadores
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
import 'package:fith_app__restaurant/widgets/CustomChip.dart';
import 'package:flutter/material.dart';

class CompleteCartItem extends StatelessWidget {
  final Dishes dish;
  final bool selected;
  CompleteCartItem({Key key, this.dish, this.selected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Column(
        children: [
          ItemCart(
            dish: dish,
            selected: selected,
          ),
          dish.additions.length >= 1
              ? ExpansionModifiersCartItem(
                  additionals: dish.additions,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class ItemCart extends StatelessWidget {
  final Dishes dish;
  final bool selected;
  ItemCart({Key key, this.dish, this.selected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Debo ir al detallado del producto");
      },
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 250,
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * defaultPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: dish.additions.length == 0
              ? BorderRadius.circular(borderRadiusCards)
              : BorderRadius.only(
                  topLeft: Radius.circular(borderRadiusCards),
                  topRight: Radius.circular(borderRadiusCards),
                ),
          color: Theme.of(context).primaryColorLight,
          border: Border.all(
            color: selected
                ? Theme.of(context).buttonColor
                : Theme.of(context).primaryColorDark.withOpacity(0.5),
            width: selected ? borderWidthSelected : borderWidhNoSelected,
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
                  image: ExactAssetImage(
                    dish.image,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
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
                          name: dish.preparation,
                          nameColor: Theme.of(context).primaryColor,
                          icon: Icons.timer,
                          iconColor: Theme.of(context).primaryColor,
                        ),
                        CustomChip(
                          name: formatterPrice(dish.price),
                          nameColor: Theme.of(context).buttonColor,
                          icon: Icons.monetization_on,
                          iconColor: Theme.of(context).buttonColor,
                        ),
                      ],
                    ),
                    Text(
                      dish.name,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context).primaryColorDark,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                    ),
                    Text(
                      dish.details.length > 55
                          ? dish.details.substring(0, 58) + " ... "
                          : dish.details,
                      style: Theme.of(context).textTheme.overline.copyWith(
                            letterSpacing: 0,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "\$${formatterPrice(dish.price)}",
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
                      width: 35,
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        dish.amount.toString(),
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
  final List<Adittional> additionals;
  ExpansionModifiersCartItem({this.additionals});
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
                child: Builder(
                  builder: (BuildContext context) {
                    List<Widget> modifiers = [];
                    widget.additionals.map((e) {
                      //Buscamos que haya algun elemento activo
                      Iterable<AditionalsOptions> isActive = e.children
                          .where((element) => element.isActive == true);
                      // print("::");
                      // //print(isActive.elementAt(0));
                      // print("::");
                      for (var option in isActive) {
                        // print(option.name);
                        // print(option.isActive);
                        // print(option.price);
                        modifiers.add(
                          ModifiersOption(
                            option: option,
                          ),
                        );
                      }
                      //si la seleccion en musltiple
                      // if (e.isMulti) {}
                    }).toList();
                    return Column(
                      children: modifiers,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ModifiersOption extends StatelessWidget {
  final AditionalsOptions option;
  ModifiersOption({this.option});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option.name,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
          ),
          Text(
            option.price != 0 ? "\$${formatterPrice(option.price)}" : 'Si',
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
          ),
        ],
      ),
    );
  }
}
