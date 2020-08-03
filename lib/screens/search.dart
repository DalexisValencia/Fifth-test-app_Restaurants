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

class ScaffoldSearch extends StatefulWidget {
  @override
  _ScaffoldSearchState createState() => _ScaffoldSearchState();
}

class _ScaffoldSearchState extends State<ScaffoldSearch> {
  bool animatedOpacity = true;
  bool startAnimatedScreen = true;
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        this.animatedOpacity = false;
      });
      startAnimationScreen();
    });
  }

  void startAnimationScreen() {
    Timer(Duration(microseconds: animationStartTime), () {
      setState(() {
        this.startAnimatedScreen = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: animatedOpacity ? 0 : 1,
      child: SafeArea(
          child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColorLight,
        body: ScaffoldMainContainer(animationScreen: startAnimatedScreen),
      )),
    );
  }
}

class ScaffoldMainContainer extends StatefulWidget {
  final bool animationScreen;
  ScaffoldMainContainer({this.animationScreen});
  @override
  _ScaffoldMainContainerState createState() => _ScaffoldMainContainerState();
}

class _ScaffoldMainContainerState extends State<ScaffoldMainContainer> {
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Column(
      children: <Widget>[
        Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: withDefaultPadding - 10),
            height: defaultHeaderCustomHeight,
            width: totalWidth,
            child: FixedTopHeader(),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: totalHeight - (defaultHeaderCustomHeight + 85),
          child: SingleChildScrollView(
              child: Container(
            width: totalWidth,
            child: SingleChildScrollView(
              //child: SearchScreen(animateScreen: widget.animationScreen),
              child: ActiveFocus(animationScreen: widget.animationScreen),
            ),
          )),
        )
      ],
    );
  }
}

class FixedTopHeader extends StatefulWidget {
  //Contenedor del buscador
  @override
  FixedTopHeaderState createState() => FixedTopHeaderState();
}

class FixedTopHeaderState extends State<FixedTopHeader> {
  bool isFocusActive = false;
  final _searchForm = GlobalKey<FormState>();
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
    debugPrint("Focus: " + _focus.hasFocus.toString());
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
        child: Form(
          key: _searchForm,
          child: Container(
              child: TextFormField(
            onFieldSubmitted: (e) {
              debugPrint("info:");
            },
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
        ));
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
          trigger: () {},
        ),
        Expanded(
          child: Hero(
            tag: 'mainSearch',
            child: _inputSearch(),
          ),
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
  final bool animationScreen;
  ActiveFocus({this.animationScreen});
  @override
  _ActiveFocusState createState() => _ActiveFocusState();
}

class _ActiveFocusState extends State<ActiveFocus> {
  bool animationScreenChild = false;
  @override
  initState() {
    super.initState();
    animationScreenChild = widget.animationScreen;
    this.startAnimation();
  }

  startAnimation() {
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        animationScreenChild = false;
      });
    });
    print('animationScreenChild');
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
          onPressed: () {
            print("ver todos $to");
          },
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
    print(animationScreenChild);
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding = totalWidth * defaultPadding;
    print(MediaQuery.of(context).viewInsets.bottom);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: withDefaultPadding),
      height: MediaQuery.of(context).viewInsets.bottom > 1
          ? MediaQuery.of(context).viewInsets.bottom
          : MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          CustomContainerAnimation(
            animationChildren: animationScreenChild,
            children: _recentSearch(),
          ),
          CustomContainerAnimation(
            animationChildren: animationScreenChild,
            children: _results(),
          ),
          // _recentSearch(),
          SizedBox(
            height: 50,
          )
        ],
      )),
    );
  }
}
