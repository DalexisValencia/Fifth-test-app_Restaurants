import 'package:flutter/material.dart';

class DiscoverScaffold extends StatefulWidget {
  @override
  _DiscoverScaffoldState createState() => _DiscoverScaffoldState();
}

class _DiscoverScaffoldState extends State<DiscoverScaffold> {
  double heightAppBar = 55;

  Widget _screenTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.015,
        left: MediaQuery.of(context).size.width * 0.07,
        right: MediaQuery.of(context).size.width * 0.07,
        bottom: MediaQuery.of(context).size.height * 0.015,
      ),
      child: Text(
        "Discovery",
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headline4.copyWith(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _nearYouContainer() {
    return NearYou();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: heightAppBar),
                color: Theme.of(context).primaryColorLight,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _screenTitle(),
                      _nearYouContainer(),
                      Container(
                        color: Colors.blue,
                        height: 200,
                      ),
                      Container(
                        color: Colors.red,
                        height: 200,
                      ),
                      Container(
                        color: Colors.blue,
                        height: 200,
                      )
                    ],
                  ),
                )),
            Positioned(
              top: 0,
              child: MainTopHeader(myheight: heightAppBar),
            ),
          ],
        ),
      ),
    );
  }
}

class MainTopHeader extends StatefulWidget {
  final double myheight;
  MainTopHeader({this.myheight});
  @override
  _MainTopHeaderState createState() => _MainTopHeaderState();
}

class _MainTopHeaderState extends State<MainTopHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.07),
      height: widget.myheight,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text("izquierda"), Text("Derecha")],
      ),
    );
  }
}

class NearYou extends StatefulWidget {
  @override
  _NearYouState createState() => _NearYouState();
}

class _NearYouState extends State<NearYou> {
  Widget _header() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.07,
          MediaQuery.of(context).size.height * 0.002,
          0,
          MediaQuery.of(context).size.height * 0.002),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Near you",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).primaryColorDark),
          ),
          MaterialButton(
            padding: EdgeInsets.all(0),
            splashColor: Theme.of(context).buttonColor,
            height: 25,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {},
            child: Text(
              "see all",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }

  Widget _suggestions() {
    return Container(
      // color: Colors.amber,
      height: 160,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return _suggestionsCards(index);
          }),
    );
  }

  Widget _suggestionsCards(index) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(
          right: index < 9 ? MediaQuery.of(context).size.width * 0.04 : 5),
      width: MediaQuery.of(context).size.width / 2.6,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2.6,
            height: 110,
            decoration: BoxDecoration(
                // color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage('assets/banner/sould-food.png'))),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColorLight,
                          size: 11,
                        ),
                        Text(
                          "4.8",
                          style: Theme.of(context).textTheme.caption.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              color: Theme.of(context).primaryColorLight),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.6,
            padding: EdgeInsets.only(top: 6),
            child: Column(
              // mainAxisAlignment: ,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'House of blues',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.caption.copyWith(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.w700),
                ),
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'detail product small text',
                      style: Theme.of(context).textTheme.caption.copyWith(
                          wordSpacing: 0.5,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_header(), _suggestions()],
    );
  }
}
