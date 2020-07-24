import 'package:fith_app__restaurant/widgets/roundedIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DiscoverScaffold extends StatefulWidget {
  @override
  _DiscoverScaffoldState createState() => _DiscoverScaffoldState();
}

class _DiscoverScaffoldState extends State<DiscoverScaffold> {
  double heightAppBar = 55;
  _changeStatusBarThemeColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Theme.of(context).primaryColorLight, // status bar color
    ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  initState() {
    super.initState();
  }

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

  Widget _newLaunch() {
    return NewLaunch();
  }

  Widget _topRestaurants() {
    return TopRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    _changeStatusBarThemeColor();
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
                      _newLaunch(),
                      _topRestaurants()
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
      color: Theme.of(context).primaryColorLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleIconButton(
            icon: Icons.arrow_back,
            color: Theme.of(context).primaryColorDark,
            bgColor: Theme.of(context).primaryColorLight,
            trigger: () {
              print("Holiwis");
            },
          ),
          CircleIconButton(
            icon: Icons.search,
            color: Theme.of(context).primaryColorDark,
            bgColor: Theme.of(context).accentColor.withOpacity(0.4),
            trigger: () {
              print("Holiwis");
            },
          ),
        ],
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

class NewLaunch extends StatefulWidget {
  @override
  _NewLaunchState createState() => _NewLaunchState();
}

class _NewLaunchState extends State<NewLaunch> {
  Widget _header() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.07),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "New Launch",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w800),
          ),
          CircleIconButton(
            icon: Icons.tune,
            color: Theme.of(context).primaryColorDark,
            bgColor: Theme.of(context).primaryColorLight,
            trigger: () {
              print("Holiwis");
            },
          ),
        ],
      ),
    );
  }

  Widget _newLauchContainer() {
    List latestLaunched = [1, 2, 3];
    return Container(
      child: Builder(builder: (BuildContext context) {
        List<Widget> _totalLaunched = [];
        latestLaunched.map((e) {
          _totalLaunched.add(NewLaunchedWrapper());
        }).toList();
        return Column(
          children: _totalLaunched,
        );
      }),
    );
    // return NewLaunchedWrapper();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_header(), _newLauchContainer()],
      ),
    );
  }
}

class NewLaunchedWrapper extends StatefulWidget {
  @override
  _NewLaunchedWrapperState createState() => _NewLaunchedWrapperState();
}

class _NewLaunchedWrapperState extends State<NewLaunchedWrapper> {
  Widget _wrapperImage() {
    return Container(
      height: 240,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/banner/french-food.png'))),
    );
  }

  Widget _cardHeader() {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  width: 0.6))),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.010),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'House of Blues san diego',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'address direction or description',
                        style: Theme.of(context).textTheme.caption.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.restaurant_menu,
                size: 20,
                color: Theme.of(context).primaryColorLight,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  width: 0.6))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _iconAnText(Icons.star, Theme.of(context).buttonColor, '4.8 votes'),
          _iconAnText(
              Icons.timer, Theme.of(context).primaryColorDark, '30 minutes'),
          _iconAnText(Icons.format_align_right,
              Theme.of(context).primaryColorDark, 'Agenda')
        ],
      ),
    );
  }

  Widget _cardComments() {
    List comments = [1, 2];
    return Container(
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> wComments = [];
          comments.asMap().entries.map((e) {
            int idx = e.key;
            print(idx);
            print(comments.length);
            wComments.add(Container(
              decoration: BoxDecoration(
                  // color: Colors.red,
                  border: Border(
                      bottom: BorderSide(
                          color: (idx + 1) == comments.length
                              ? Colors.transparent
                              : Theme.of(context).primaryColor.withOpacity(0.6),
                          width: 0.6))),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 47,
                      height: 47,
                      child: CircleAvatar(
                        backgroundColor: Colors.amber,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Nombre del usuario',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.bold),
                          ),
                          FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Comentario que ha colocado el ususario',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context).primaryColor),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
          }).toList();
          return Column(
            children: wComments,
          );
        },
      ),
    );
  }

  Widget _cardWrapper() {
    return Container(
      transform: Matrix4.translationValues(0, -100, 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  color: Theme.of(context).primaryColorDark.withOpacity(0.5),
                  offset: Offset(0, 0))
            ],
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width * 0.72,
        child: Column(
          children: <Widget>[_cardHeader(), _cardBody(), _cardComments()],
        ),
      ),
    );
  }

  Widget _iconAnText(icon, color, text) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 14,
          color: color,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.button.copyWith(
              fontSize: 13,
              color: Theme.of(context).primaryColorDark,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.07),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          _wrapperImage(),
          Positioned(
            top: 200,
            left: MediaQuery.of(context).size.width * 0.07,
            child: _cardWrapper(),
          )
        ],
      ),
    );
  }
}

class TopRestaurants extends StatefulWidget {
  @override
  _TopRestaurantsState createState() => _TopRestaurantsState();
}

class _TopRestaurantsState extends State<TopRestaurants> {
  Widget _header() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.010),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Top Retaurants",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w800),
          ),
          MaterialButton(
            padding: EdgeInsets.all(0),
            elevation: 0,
            onPressed: () {},
            color: Theme.of(context).primaryColorLight,
            splashColor: Theme.of(context).buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              "See all",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  Widget _topRestaurant() {
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.07),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.38,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/populars/Salade-Niçoise.jpg'))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 10,
              child: FittedBox(
                child: Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColorLight),
                  child: Text("La info"),
                ),
              )),
        ],
      ),
    );
  }

  Widget _nextTops() {
    List anotherTops = List(5);
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.07,
          top: MediaQuery.of(context).size.width * 0.05),
      child: Builder(builder: (BuildContext context) {
        List<Widget> nextTops = [];
        anotherTops.map((e) {
          nextTops.add(_cardNextTops());
        }).toList();
        return Column(
          children: nextTops,
        );
      }),
    );
  }

  Widget _cardNextTops() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(0, 2),
            ) //spreadRadius: 5)
          ],
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                        'assets/populars/Salade-Niçoise.jpg'))),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Turkay Gravy Secrets",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.015),
                    child: Text(
                      "Este es un texto del detallado del restaurante de dos lineas",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
      child: Column(
        children: <Widget>[_header(), _topRestaurant(), _nextTops()],
      ),
    );
  }
}