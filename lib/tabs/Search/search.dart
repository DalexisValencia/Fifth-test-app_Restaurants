import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/search.dart';
import 'package:fith_app__restaurant/tabs/Search/components/search__fixedTopInput.dart';
import 'package:fith_app__restaurant/tabs/Search/components/Results/Results.dart';
import 'package:fith_app__restaurant/tabs/Search/components/Suggested/Suggested.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
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
          SearchInitInterface suggestedSearches =
              state.props[0] as SearchInitInterface;
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
                              child: CustomContainerAnimation(
                                animationChildren: animatedChildren,
                                children: !activeResults &&
                                        suggestedSearches.results!.length == 0
                                    ? Suggested(
                                        suggestedSearches: suggestedSearches,
                                      )
                                    : Results(),
                              ),
                            ),
                    ),
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
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColorLight,
      body: _bodyScaffold(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
