import 'package:fith_app__restaurant/interfaces/aditional.dart';
import 'package:fith_app__restaurant/widgets/AditionalsExpansions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlateDetailWrapper extends StatefulWidget {
  @override
  _PlateDetailWrapperState createState() => _PlateDetailWrapperState();
}

class _PlateDetailWrapperState extends State<PlateDetailWrapper> {
  bool minSizeReached = false;
  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
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
    // if (_controller.offset >= _controller.position.maxScrollExtent &&
    //   // print("reach the bottom");
    // }

    // if (_controller.offset <= _controller.position.minScrollExtent &&
    //   // print("reach the top");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // color: Colors.red,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      controller: _controller,
                      child: Column(
                        children: <Widget>[
                          HeaderPlateDetails(),
                          GroupPlateBasicDetails(),
                          AmountProduct(),
                          Aditionals(),
                          SummaryIngredients(),
                          PreparationTime(),
                          SizedBox(
                            height: 60,
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
                    color: minSizeReached ? Colors.white : Colors.transparent,
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
                    top: MediaQuery.of(context).padding.top + 10, bottom: 10),
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
                  height: 50,
                  child: SizedBox.expand(
                    child: AddtoCar(),
                  )),
            ),
          )
        ],
      ),
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
            child: RaisedButton(
              elevation: 0,
              splashColor: Theme.of(context).buttonColor,
              onPressed: () {},
              padding: EdgeInsets.all(0),
              shape: CircleBorder(),
              color: Theme.of(context).primaryColorDark.withOpacity(0.2),
              child: Icon(
                Icons.arrow_back,
                color: widget.iconColors,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            child: RaisedButton(
              elevation: 0,
              splashColor: Theme.of(context).buttonColor,
              onPressed: () {},
              padding: EdgeInsets.all(0),
              shape: CircleBorder(),
              color: Theme.of(context).primaryColorDark.withOpacity(0.2),
              child: Icon(
                Icons.favorite,
                color: widget.iconColors,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderPlateDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/banner/french-food.png'))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
    );
  }
}

class GroupPlateBasicDetails extends StatelessWidget {
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
                'House of Blues San Diego',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            child: Text(
              "\$29.00",
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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque auctor odio et dignissim consectetur. In hac habitasse platea dictumst. In vel ligula nec velit tincidunt ultricies',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.012),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 22,
                    color: Theme.of(context).buttonColor,
                  ),
                  Icon(
                    Icons.star,
                    size: 22,
                    color: Theme.of(context).buttonColor,
                  ),
                  Icon(
                    Icons.star,
                    size: 22,
                    color: Theme.of(context).buttonColor,
                  ),
                  Icon(
                    Icons.star,
                    size: 22,
                    color: Theme.of(context).buttonColor,
                  ),
                  Icon(
                    Icons.star,
                    size: 22,
                    color: Theme.of(context).accentColor,
                  ),
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
                ],
              )),
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
  @override
  _AmountProductState createState() => _AmountProductState();
}

class _AmountProductState extends State<AmountProduct> {
  int amount = 1;
  double priceOrigin = 29.00;
  double price = 29.00;

  @override
  void initState() {
    super.initState();
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
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.3)))),
                // color: Colors.amber,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07,
                ),
                child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Container(
                        // color: Colors.red,
                        child: Center(
                          child: Icon(
                            Icons.access_time,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    title: Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Text(
                        'Preparation Time For Plate',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    subtitle: Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Text("50 minutes",
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6),
                              fontWeight: FontWeight.w500)),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.3)))),
                // color: Colors.amber,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07,
                ),
                child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Container(
                        // color: Colors.red,
                        child: Center(
                          child: Icon(
                            Icons.access_time,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    title: Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Text(
                        'Preparation Time # Plates',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    subtitle: Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Text("1 Hour + 50 minutes",
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6),
                              fontWeight: FontWeight.w500)),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.3)))),
                // color: Colors.amber,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07,
                ),
                child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Container(
                        // color: Colors.red,
                        child: Center(
                          child: Icon(
                            Icons.attach_money,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    title: Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Text(
                        '# Plates',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    subtitle: Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Text("\$150.000",
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6),
                              fontWeight: FontWeight.w500)),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.3)))),
                // color: Colors.amber,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07,
                ),
                child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Container(
                        // color: Colors.red,
                        child: Center(
                          child: Icon(
                            Icons.attach_money,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    title: Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Text(
                        'Aditionals',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    subtitle: Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Text("\$13.000",
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6),
                              fontWeight: FontWeight.w500)),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.3)))),
                // color: Colors.amber,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07,
                ),
                child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Container(
                        // color: Colors.red,
                        child: Center(
                          child: Icon(
                            Icons.attach_money,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    title: Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Text(
                        'TOTAL',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    subtitle: Container(
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Text("\$150.000 + \$13.000 = \$163.000",
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6),
                              fontWeight: FontWeight.w500)),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
