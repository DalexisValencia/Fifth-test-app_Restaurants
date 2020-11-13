import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/search.dart';
import 'package:fith_app__restaurant/sections/SearchResults.dart';
import 'package:fith_app__restaurant/sections/SearchSuggested.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
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
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          this.activeResults = visible;
        });
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
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          SearchInitInterface suggestedSearches = state.props[0];
          print(suggestedSearches);
          return Column(
            children: <Widget>[
              Container(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: withDefaultPadding - 10),
                  height: defaultHeaderCustomHeight,
                  width: totalWidth,
                  // child: Hero(
                  //   tag: 'mainSearch',
                  //   child: FixedTopHeader(),
                  // )
                  child:
                      suggestedSearches == null ? SizedBox() : FixedTopHeader(),
                ),
              ),
              Expanded(
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: animateOpacity ? 0 : 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        child: suggestedSearches == null
                            ? SizedBox()
                            : Container(
                                width: totalWidth,
                                // child:
                                //     SearchScreen(suggestedSearches: suggestedSearches)
                                child: CustomContainerAnimation(
                                    animationChildren: animatedChildren,
                                    children: !activeResults &&
                                            suggestedSearches.results.length ==
                                                0
                                        ? SearchScreen(
                                            suggestedSearches:
                                                suggestedSearches)
                                        : SearchResults()))),
                  ),
                ),
              )
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
        body: _bodyScaffold()
        // body: SafeArea(
        //   child: _bodyScaffold(),
        // )
        //
        );
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
  final TextEditingController searcController = new TextEditingController();
  SearchBloc searchBloc;
  @override
  void initState() {
    super.initState();
    //_focus.hasFocus
    // _focus.addListener(widget.onfocusSearch);
    searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  void clickInIconTextFormField(resulst) {
    // si no hay nada en el campo de busqueda
    if (searcController.value.text == '') {
      _focus.requestFocus();
    }
    // si existe algo en el campo de busqueda independiente de si tiene resultados o no
    else if (searcController.value.text != '') {
      //si hay resultados limpiamos
      if (resulst.results.length >= 1) {
        searchBloc.add(ClearSearch());
      }
      FocusScope.of(context).unfocus();
      searcController.clear();
    }
  }

  OutlineInputBorder defaulBorderInput() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5), topRight: Radius.circular(5)),
        borderSide:
            new BorderSide(color: Theme.of(context).cardColor, width: 0));
  }

  Widget _iconTextFormField() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        SearchInitInterface modelSearch = state.props[0];
        return GestureDetector(
          child: Container(
            width: 40,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: RaisedButton(
                animationDuration: Duration(milliseconds: 10),
                padding: EdgeInsets.all(0),
                elevation: 0,
                color: Colors.transparent,
                splashColor: Theme.of(context).buttonColor,
                child: Icon(
                  modelSearch.results.length >= 1 && searcController.text != ''
                      ? Icons.close
                      : Icons.search,
                  size: 16,
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                ),
                onPressed: () {},
                onHighlightChanged: (val) {
                  //Se ejecuta cuando se deja de presionar el boton
                  if (val == false) {
                    clickInIconTextFormField(modelSearch);
                  }
                }),
          ),
        );
      },
    );
  }

  Widget _inputSearch() {
    return Expanded(
      flex: 1,
      child: Material(
          child: Form(
        child: Container(
            child: TextFormField(
          onChanged: (val) {
            if (val.length >= 1) {
              searchBloc.add(Searching(term: val));
            } else if (val.length == 0) {
              searchBloc.add(ClearSearch());
            }
          },
          controller: searcController,
          onFieldSubmitted: (e) {},
          focusNode: _focus,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).highlightColor, // .withOpacity(0.7)
            contentPadding: EdgeInsets.all(0),
            // prefixIcon: Icon(Icons.search),
            // prefixStyle: TextStyle(
            //     color: Theme.of(context).buttonColor,
            //     fontWeight: FontWeight.w700),
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
      )),
    );
  }

  Widget _searchWrapper() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).highlightColor,
        ),
        height: 40,
        child: Row(
          children: <Widget>[_iconTextFormField(), _inputSearch()],
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
          trigger: () {
            Navigator.pop(context);
          },
        ),
        Expanded(
          child: _searchWrapper(),
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

  @override
  dispose() {
    super.dispose();
    // this.searcController.dispose();
  }
}
