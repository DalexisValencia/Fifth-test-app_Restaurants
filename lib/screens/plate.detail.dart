import 'package:fith_app__restaurant/interfaces/aditional.dart';
import 'package:fith_app__restaurant/widgets/AditionalsExpansions.dart';
import 'package:flutter/material.dart';

class PlateDetailWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderPlateDetails(),
          GroupPlateBasicDetails(),
          Aditionals()
          // RoundedOptionsContactWrapper()
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
          color: Colors.amber,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/banner/french-food.png'))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
            left: 0,
            child: Container(
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
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.2),
                      child: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColorLight,
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
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.2),
                      child: Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
      // color: Colors.blue,
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
            // color: Colors.amber,
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
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.008),
            // color: Colors.white,
            child: Text(
              'short description of product',
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
  bool activeTab = null;

  setActiveTab(tabIndex) {
    print("ahora le damos activo a otro");
    setState(() {
      activeTab = tabIndex == activeTab ? null : activeTab;
    });
  }

  Widget _header() {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.010),
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Adicionales",
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
      ])
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.amber,
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> expandible = [];
          aditionals.map((item) {
            print(item.children);
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
