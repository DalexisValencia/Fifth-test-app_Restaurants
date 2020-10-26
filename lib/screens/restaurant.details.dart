import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/ContactInterface.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/sections/CardAvailableForLunch.dart';
import 'package:fith_app__restaurant/sections/CardCategorySuggested.dart';
import 'package:fith_app__restaurant/sections/CustomHeader.dart';
// import 'package:fith_app__restaurant/sections/CardsHighlightRestaurants.dart';
import 'package:fith_app__restaurant/sections/RoundedOptions.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantDetailWrapper extends StatefulWidget {
  @override
  _RestaurantDetailWrapperState createState() =>
      _RestaurantDetailWrapperState();
}

class _RestaurantDetailWrapperState extends State<RestaurantDetailWrapper>
    with SingleTickerProviderStateMixin {
  bool minSizeReached = false;
  bool animationScreenOpacity = true;
  bool animationScreenContainer = true;
  ScrollController _controller;

  @override
  void initState() {
    this.animationScreenContainer = this.animationScreenOpacity;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    this.startAnimationOpacity();
  }

  void startAnimationOpacity() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        animationScreenOpacity = false;
      });
      this.startAnimationContainer();
    });
  }

  void startAnimationContainer() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        animationScreenContainer = false;
      });
    });
  }

  _scrollListener() {
    if (_controller.offset > 100 && !minSizeReached) {
      setState(() {
        minSizeReached = true;
      });
    }
    if (_controller.offset < 100 && minSizeReached) {
      setState(() {
        minSizeReached = false;
      });
    }
  }

  Widget _headerCustom() {
    return AnimatedContainer(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: minSizeReached
                      ? Theme.of(context).primaryColorDark.withOpacity(0.3)
                      : Colors.transparent,
                  width: 1)),
          color: Theme.of(context).primaryColorLight,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: Offset(0, 2),
                color: minSizeReached
                    ? Theme.of(context).accentColor
                    : Colors.transparent)
          ]),
      duration: Duration(milliseconds: 500),
      height: defaultHeaderCustomHeight,
      width: MediaQuery.of(context).size.width,
      child: CustomHeader(
        firstAction: 'goBack',
        secondAction: 'search',
        iconColors: Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _bodyRestaurantsDetail() {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    double lessHeight =
        (MediaQuery.of(context).padding.top + defaultHeaderCustomHeight);
    return AnimatedOpacity(
        duration:
            Duration(milliseconds: animationOpacityTime), //animationOpacityTime
        opacity: animationScreenOpacity ? 0 : 1,
        child: Container(
            height: MediaQuery.of(context).size.height - lessHeight,
            child: SingleChildScrollView(
                controller: _controller,
                child:
                    BlocBuilder<DetailsrestaurantBloc, DetailsrestaurantState>(
                  builder:
                      (BuildContext context, DetailsrestaurantState state) {
                    Restaurants currentRestaurant = state.props[0];
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.03),
                          padding: EdgeInsets.symmetric(
                              horizontal: withDefaultPadding),
                          width: MediaQuery.of(context).size.width,
                          child: TitleAndShortDescription(
                              title: currentRestaurant.name,
                              description: currentRestaurant.description),
                        ),
                        CustomContainerAnimation(
                          animationChildren: animationScreenContainer,
                          children: WrapperMap(),
                        ),
                        CustomContainerAnimation(
                          animationChildren: animationScreenContainer,
                          children: DetailHighlightProduct(),
                        ),
                        CustomContainerAnimation(
                          animationChildren: animationScreenContainer,
                          children: ExploreTheMenu(),
                        ),
                        CustomContainerAnimation(
                          animationChildren: animationScreenContainer,
                          children: CardCategorySuggested(),
                        ),
                        // CustomContainerAnimation(
                        //   animationChildren: animationScreenContainer,
                        //   children: HightlightResturantsWrapper(),
                        // ),
                        CustomContainerAnimation(
                          animationChildren: animationScreenContainer,
                          children: RoundedOptionsContactWrapper(),
                        ),
                        CustomContainerAnimation(
                          animationChildren: animationScreenContainer,
                          children: ContactMethods(),
                        ),
                      ],
                    );
                  },
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SafeArea(
      child: Column(
        children: <Widget>[_headerCustom(), _bodyRestaurantsDetail()],
      ),
    )));
  }
}

class TitleAndShortDescription extends StatelessWidget {
  final String title;
  final String description;
  TitleAndShortDescription({this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(description)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: CircleIconButton(
            icon: Icons.favorite_border,
            color: Theme.of(context).primaryColorDark,
            bgColor: Colors.transparent,
            trigger: () {},
          ),
        )
      ],
    );
  }
}

class WrapperMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
      color: Theme.of(context).accentColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
    );
  }
}

class DetailHighlightProduct extends StatefulWidget {
  @override
  _DetailHighlightProductState createState() => _DetailHighlightProductState();
}

class _DetailHighlightProductState extends State<DetailHighlightProduct> {
  Widget _wrapperHeader() => FullSectionTitle(
        title: 'Available for lunch now',
        rightContainer:
            RoundedCustomButton(title: 'See all', callPressed: () {}),
      );

  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.01,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: withDefaultPadding),
            child: _wrapperHeader(),
          ),
          Container(
              margin: EdgeInsets.only(left: withDefaultPadding - 10),
              child: Align(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 2 / 2.030,
                  child: Container(
                    child: CompleteListAvailablePlates(),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class ExploreTheMenu extends StatefulWidget {
  @override
  _ExploreTheMenuState createState() => _ExploreTheMenuState();
}

class _ExploreTheMenuState extends State<ExploreTheMenu> {
  Widget _header() => Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * defaultPadding),
      child: FullSectionTitle(
        title: 'Explore the Menu',
        rightContainer:
            RoundedCustomButton(title: 'See all', callPressed: () {}),
      ));

  List _chipsLikeMenuList = [
    'Champiñones (100)',
    'Ensaladas (200)',
    'Frescos (120)',
    'Almuerzos (123)',
    'Comida Rapida (10)'
  ];

  Widget _chipsAsMenu() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * defaultPadding),
        child: Builder(builder: (BuildContext context) {
          List<Widget> chips = [];
          _chipsLikeMenuList.map((e) {
            chips.add(Container(
                child: Chip(
                    label: Text(
              '$e',
              maxLines: 1,
            ))));
          }).toList();
          return Wrap(
            runSpacing: -8,
            spacing: 5,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: chips,
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _header(),
          _chipsAsMenu(),
        ],
      ),
    );
  }
}

class ContactMethods extends StatefulWidget {
  @override
  ContactMethodsState createState() => ContactMethodsState();
}

class ContactMethodsState extends State<ContactMethods> {
  List<ContactInterface> _contactPhones = [
    ContactInterface(name: 'Phone', phone: '7153914', action: 'call'),
    ContactInterface(
        name: 'Mail', phone: 'company@contact.com', action: 'mail'),
    ContactInterface(name: 'Whatsapp', phone: '7153914', action: 'whatsapp'),
    ContactInterface(
        name: 'Average Cost', phone: '\$12.00 - \$44.00', action: 'none')
  ];
  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;

    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: withDefaultPadding),
      child: Builder(builder: (BuildContext context) {
        List<Widget> contacts = [];
        _contactPhones.map((e) {
          contacts.add(Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 0.3, color: Theme.of(context).primaryColor))),
            child: SizedBox.expand(
                child: MaterialButton(
              onPressed: () async {
                const String url = 'tel://7153914';
                bool showSnackBar = false;
                String alertSnackBar = '';
                if (e.action == 'call') {
                  if (await canLaunch(url)) {
                    launch(url);
                  } else {
                    showSnackBar = true;
                    alertSnackBar = 'Ha ocurrido un error';
                  }
                }
                if (e.action == 'mail') {
                  if (await canLaunch(url)) {
                    final Uri _emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: e.phone,
                        queryParameters: {'suject': 'Username and lastName'});

                    launch(_emailLaunchUri.toString());
                  } else {
                    showSnackBar = true;
                    alertSnackBar = 'No hemos podido abrir el email ';
                  }
                }
                if (e.action == 'whatsapp') {
                  var whatsappUrl = "whatsapp://send?phone=3107127993";
                  if (await canLaunch(url)) {
                    launch(whatsappUrl);
                  } else {
                    showSnackBar = true;
                    alertSnackBar =
                        '¿Puede revisar si whatsapp esta instalado?';
                  }
                }
                if (showSnackBar) {
                  final snackBar = SnackBar(
                    content: Text(
                      alertSnackBar,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Theme.of(context).primaryColorLight),
                    ),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(e.name),
                  FittedBox(
                      child: Text(
                    e.phone,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Theme.of(context).buttonColor,
                        fontWeight: FontWeight.w500),
                  ))
                ],
              ),
            )),
          ));
        }).toList();
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: contacts,
        );
      }),
    );
  }
}
