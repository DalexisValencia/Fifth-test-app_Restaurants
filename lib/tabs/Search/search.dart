import 'dart:async';

import 'package:restaurants/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/search.dart';
import 'package:restaurants/tabs/Search/components/search__fixedTopInput.dart';
import 'package:restaurants/tabs/Search/components/Results/Results.dart';
import 'package:restaurants/tabs/Search/components/Suggested/Suggested.dart';
import 'package:restaurants/widgets/AnimationContainerWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ScaffoldSearch extends StatefulWidget {
  final String? from;
  final TabController? controller;
  ScaffoldSearch({
    Key? key,
    this.from,
    this.controller,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            SearchInitInterface suggestedSearches =
                state.props[0] as SearchInitInterface;
            return Column(
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: withDefaultPadding - 10,
                    ),
                    height: defaultHeaderCustomHeight,
                    width: totalWidth,
                    child: FixedTopHeader(
                      from: widget.from,
                      controller: widget.controller,
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: animateOpacity ? 0 : 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Container(
                          width: totalWidth,
                          child: CustomContainerAnimation(
                            animationChildren: animatedChildren,
                            children: KeyboardVisibilityBuilder(
                              builder: (context, isKeyboardVisible) {
                                return !isKeyboardVisible &&
                                        suggestedSearches.results!.length == 0
                                    ? Suggested(
                                        suggestedSearches: suggestedSearches,
                                      )
                                    : Results();
                              },
                            ),
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
