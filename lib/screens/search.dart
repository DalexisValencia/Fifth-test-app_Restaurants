import 'dart:async';

import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/sections/CardCategorySuggested.dart';
import 'package:fith_app__restaurant/sections/CardsHighlightRestaurants.dart';
import 'package:fith_app__restaurant/sections/ChipCategoriesSuggested.dart';
import 'package:fith_app__restaurant/sections/PopularsSuggested.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';

// class ScaffoldSearch extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       resizeToAvoidBottomPadding: false,
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Theme.of(context).primaryColorLight,
//       body: ScaffoldMainContainer(),
//     ));
//   }
// }

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
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: withDefaultPadding),
          height: totalHeight * 0.10,
          width: totalWidth,
          child: FixedTopHeader(),
        ),
      ),
      Container(
        width: totalWidth,
        child: SingleChildScrollView(
          child: SearchScreen(animateScreen: widget.animationScreen),
        ),
      )
    ]));
  }
}

class FixedTopHeader extends StatefulWidget {
  //Contenedor del buscador
  @override
  FixedTopHeaderState createState() => FixedTopHeaderState();
}

class FixedTopHeaderState extends State<FixedTopHeader> {
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
            child: SearchWidget(),
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
    Timer(Duration(milliseconds: 2000), () {
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

/*:::WIDGET SEARCH:::*/
class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _searchForm = GlobalKey<FormState>();

  OutlineInputBorder defaulBorderInput() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:
            new BorderSide(color: Theme.of(context).cardColor, width: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: Form(
          key: _searchForm,
          child: Container(
              child: TextFormField(
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
}
