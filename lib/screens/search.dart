import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/search.dart';
import 'package:fith_app__restaurant/sections/CardsHighlightRestaurants.dart';
import 'package:fith_app__restaurant/sections/ChipCategoriesSuggested.dart';
import 'package:fith_app__restaurant/sections/DishSuggestionInSearch.dart';
import 'package:fith_app__restaurant/sections/PopularsSuggested.dart';
import 'package:fith_app__restaurant/sections/ResultsSearch.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
// import 'package:fith_app__restaurant/widgets/quickViewCard.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class ScaffoldSearch extends StatefulWidget {
  @override
  _ScaffoldSearchState createState() => _ScaffoldSearchState();
}

class _ScaffoldSearchState extends State<ScaffoldSearch> {
  bool animatedOpacity = true;
  bool animateOpacity = true;
  bool animatedChildren = true;
  bool activeResults = false;
  @override
  void initState() {
    super.initState();
    this.startAnimationScreen();
    // _focus.addListener(isfocusActive);

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          this.activeResults = visible;
        });
        print(this.activeResults);
      },
    );
  }

  void startAnimationScreen() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        this.animateOpacity = false;
      });
      startChildAnimation();
    });
  }

  void startChildAnimation() {
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
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          SearchInitInterface suggestedSearches = state.props[0];
          return Column(
            children: <Widget>[
              Container(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: withDefaultPadding - 10),
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
                  height: totalHeight -
                      (withDefaultPadding + defaultHeaderCustomHeight),
                  child: SingleChildScrollView(
                      child: Container(
                          width: totalWidth,
                          child: CustomContainerAnimation(
                              animationChildren: animatedChildren,
                              children: !activeResults
                                  ? SearchScreen(
                                      suggestedSearches: suggestedSearches)
                                  : SearchResults()
                              //
                              )
                          // children: !activeResults
                          //     ? AnimatedOpacity(
                          //         duration: Duration(seconds: 2),
                          //         opacity: activeResults ? 0 : 1,
                          //         child: SearchScreen(
                          //             suggestedSearches: suggestedSearches),
                          //       )
                          //     : AnimatedOpacity(
                          //         duration: Duration(seconds: 2),
                          //         opacity: !activeResults ? 0 : 1,
                          //         child: SearchResults( ),
                          //       )),
                          )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColorLight,
        body: _bodyScaffold());
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class FixedTopHeader extends StatefulWidget {
  @override
  FixedTopHeaderState createState() => FixedTopHeaderState();
}

class FixedTopHeaderState extends State<FixedTopHeader> {
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    //_focus.hasFocus
    // _focus.addListener(widget.onfocusSearch);
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
  final SearchInitInterface suggestedSearches;
  SearchScreen({this.suggestedSearches});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool loading = true;

  @override
  initState() {
    super.initState();
    Timer(Duration(milliseconds: 200), () {
      setState(() {
        loading = false;
      });
    });
  }

  Widget loadingWidget() {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.40),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).buttonColor,
            strokeWidth: 4,
          ),
        ));
  }

  Widget _bodySearch() {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding = totalWidth * defaultPadding;
    return Column(
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.only(top: totalWidth * 0.03, left: withDefaultPadding),
          width: totalWidth,
          height: 40,
          child: RelatedCategories(),
        ),
        widget.suggestedSearches.suggestions.length >= 1
            ? WrapperSuggestionSearch(
                suggestions: widget.suggestedSearches.suggestions)
            : SizedBox(),
        widget.suggestedSearches.popular.length >= 1
            ? PopularSuggestedWrapper(
                popularSuggestions: widget.suggestedSearches.popular)
            : SizedBox(),
        widget.suggestedSearches.highlightRestaurants.length >= 1
            ? HightlightResturantsWrapper(
                restaurantSuggestions:
                    widget.suggestedSearches.highlightRestaurants)
            : SizedBox(),
        Text("Cuando se busca desde la vista de resurante"),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // children: <Widget>[loadingWidget()],
      children: <Widget>[loading ? loadingWidget() : _bodySearch()],
    );
  }
}
