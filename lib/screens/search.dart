import 'dart:async';

import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/sections/CardCategorySuggested.dart';
import 'package:fith_app__restaurant/sections/CardsHighlightRestaurants.dart';
import 'package:fith_app__restaurant/sections/ChipCategoriesSuggested.dart';
import 'package:fith_app__restaurant/sections/PopularsSuggested.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/quickViewCard.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';
// Bloc pattern:
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/productdetails_bloc.dart';

class ScaffoldSearch extends StatefulWidget {
  @override
  _ScaffoldSearchState createState() => _ScaffoldSearchState();
}

class _ScaffoldSearchState extends State<ScaffoldSearch> {
  bool animatedOpacity = true;
  bool animateOpacity = true;
  bool animatedChildren = true;
  // ProductdetailsBloc detailBloc;
  @override
  void initState() {
    super.initState();
    // detailBloc = BlocProvider.of<ProductdetailsBloc>(context);
    this.startAnimationScreen();
  }

  void startAnimationScreen() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        this.animateOpacity = false;
      });
      startChildAnimartion();
    });
  }

  void startChildAnimartion() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        animatedChildren = false;
      });
    });
  }

  Widget _bodyScaffold() {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Column(
      children: <Widget>[
        Container(
          child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: withDefaultPadding - 10),
              height: defaultHeaderCustomHeight,
              width: totalWidth,
              child: Hero(
                tag: 'mainSearch',
                child: FixedTopHeader(),
              )),
        ),
        AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: animateOpacity ? 0 : 1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: totalHeight - (defaultHeaderCustomHeight + 90),
            child: SingleChildScrollView(
                child: Container(
              width: totalWidth,
              child: SingleChildScrollView(
                  child: CustomContainerAnimation(
                animationChildren: animatedChildren,
                children: ActiveFocus(),
              )
                  //child: SearchScreen(animateScreen: widget.animationScreen),
                  ),
            )),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColorLight,
      body: BlocProvider(
        create: (BuildContext context) => ProductdetailsBloc(),
        child: _bodyScaffold(),
      ),
      // body: _bodyScaffold(),
      //
    )
        //
        );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class FixedTopHeader extends StatefulWidget {
  //Contenedor del buscador
  @override
  FixedTopHeaderState createState() => FixedTopHeaderState();
}

class FixedTopHeaderState extends State<FixedTopHeader> {
  bool isFocusActive = false;
  // final _searchForm = GlobalKey<FormState>();
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  _onFocusChange() {
    setState(() {
      isFocusActive = _focus.hasFocus;
    });
    //debugPrint("Focus: " + _focus.hasFocus.toString());
  }

  OutlineInputBorder defaulBorderInput() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:
            new BorderSide(color: Theme.of(context).cardColor, width: 0));
  }

  Widget _inputSearch() {
    return Container(
        height: 40,
        child: Material(
            child: Form(
          // key: _searchForm,
          child: Container(
              child: TextFormField(
            onFieldSubmitted: (e) {},
            focusNode: _focus,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).highlightColor, // .withOpacity(0.7)
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search),
              prefixStyle: TextStyle(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w700),
              hintText: 'Search ...',
              hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  fontWeight: FontWeight.w600),
              border: defaulBorderInput(),
              focusedBorder: defaulBorderInput(),
              enabledBorder: defaulBorderInput(),
              disabledBorder: defaulBorderInput(),
            ),
          )),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleIconButton(
          icon: Icons.arrow_back,
          color: Theme.of(context).primaryColorDark,
          bgColor: Theme.of(context).accentColor.withOpacity(.1),
          trigger: () {
            Navigator.pop(context);
          },
        ),
        Expanded(
          child: _inputSearch(),
        ),
        CircleIconButton(
          icon: Icons.more_vert,
          color: Theme.of(context).primaryColorDark.withOpacity(0.7),
          bgColor: Theme.of(context).accentColor.withOpacity(.1),
          trigger: () {},
        ),
      ],
    );
  }
}

class SearchScreen extends StatefulWidget {
  final bool animateScreen;
  SearchScreen({this.animateScreen});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool animateScreenChildrenContainer = true;
  @override
  void initState() {
    super.initState();
    startAnimationContainer();
  }

  void startAnimationContainer() {
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        animateScreenChildrenContainer = false;
      });
    });
  }

  Widget _bodySearch() {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding = totalWidth * defaultPadding;
    return Column(
      children: <Widget>[
        CustomContainerAnimation(
          animationChildren: animateScreenChildrenContainer,
          children: Container(
            margin: EdgeInsets.only(
                top: totalWidth * 0.03, left: withDefaultPadding),
            width: totalWidth,
            height: 40,
            child: RelatedCategories(),
          ),
        ),
        CustomContainerAnimation(
            animationChildren: animateScreenChildrenContainer,
            children: Container(
              child: CardCategorySuggested(),
            )),
        CustomContainerAnimation(
          animationChildren: animateScreenChildrenContainer,
          children: Container(
            child: PopularSuggestedWrapper(),
          ),
        ),
        CustomContainerAnimation(
          animationChildren: animateScreenChildrenContainer,
          children: Container(
            child: HightlightResturantsWrapper(),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _bodySearch();
  }
}

class ActiveFocus extends StatefulWidget {
  @override
  _ActiveFocusState createState() => _ActiveFocusState();
}

class _ActiveFocusState extends State<ActiveFocus> {
  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _seeAll(title, to) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Align(
        child: MaterialButton(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.transparent,
          splashColor: Theme.of(context).splashColor,
          onPressed: () {},
          child: Text(
            title,
            style: Theme.of(context).textTheme.caption.copyWith(
                decoration: TextDecoration.underline,
                color: Theme.of(context).primaryColorDark),
          ),
        ),
      ),
    );
  }

  Widget _totalregisters(registers) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 5),
      child: Align(
          alignment: Alignment.topRight,
          child: Text(registers,
              style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w400))),
    );
  }

  Widget _recentSearch() {
    var recentsSearchs = [1, 2, 3];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Recientes",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              List<Widget> recent = [];
              recent.add(_totalregisters('Recents 3 of 20'));
              recentsSearchs.map((e) {
                recent.add(Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  //color: Colors.blue[400],
                  child: QuickView(),
                ));
              }).toList();

              recent.add(_seeAll('See all recents', 'recente-search'));

              return Column(
                children: recent,
              );
            },
          )
        ],
      ),
    );
  }

  Widget _results() {
    var recentsSearchs = [1, 2, 3];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Results",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              List<Widget> recent = [];
              recent.add(_totalregisters('Results 3 of 40'));
              recentsSearchs.map((e) {
                recent.add(Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: QuickView(),
                ));
              }).toList();
              recent.add(_seeAll('See all results', 'recente-search'));
              return Column(
                children: recent,
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding = totalWidth * defaultPadding;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: withDefaultPadding),
      height: MediaQuery.of(context).viewInsets.bottom > 1
          ? MediaQuery.of(context).viewInsets.bottom
          : MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          _recentSearch(),
          _results(),
          // _recentSearch(),
          SizedBox(
            height: 50,
          )
        ],
      )),
    );
  }
}
