import 'dart:async';
import 'dart:ui';

import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/sections/AppBarCustom.dart';
// import 'package:fith_app__restaurant/sections/CustomHeader.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/quickViewCard.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool opacityActive = true;
  bool animatedContainerActive = true;
  List<int> forDelete = [];
  @override
  initState() {
    super.initState();
    _activeAnimationOpacity();
  }

  _activeAnimationOpacity() {
    Timer(
        Duration(
          milliseconds: animationStartTime,
        ), () {
      setState(() {
        opacityActive = false;
      });
      _activeAnimationContainer();
    });
  }

  _activeAnimationContainer() {
    Timer(
        Duration(
          microseconds: animationStartTime,
        ), () {
      setState(() {
        animatedContainerActive = false;
      });
    });
  }

  Widget _screenNavigator() {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      //padding: EdgeInsets.symmetric(horizontal: ),
      width: MediaQuery.of(context).size.width,
      height: defaultHeaderCustomHeight,
      child: AppBarCustom(
        iconLeft: ArrowBackHeaderButton(),
        iconRigth: TrashFavoriteHeaderButton(
          amout: forDelete.length,
        ),
      ),
      // child: CustomHeader(
      //   firstAction: 'goBack',
      //   secondAction: 'favorite',
      //   iconColors: Theme.of(context).primaryColorDark,
      // ),
    );
  }

  Widget _builderCardFavorites() {
    List favoritesExample = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * defaultPadding,
      ),
      child: BlocProvider(
        create: (BuildContext context) => DishBloc(),
        child: Builder(
          builder: (BuildContext context) {
            List<Widget> favoriteCards = [];
            favoritesExample.asMap().entries.map((e) {
              int index = e.key;
              favoriteCards.add(
                GestureDetector(
                  onLongPress: () {
                    var isInList = forDelete.contains(index);
                    setState(() {
                      if (isInList == false) {
                        forDelete.add(index);
                      }
                      if (isInList == true) {
                        forDelete.remove(index);
                      }
                    });
                  },
                  child: QuickView(
                    dish: dishes[0],
                    borderCustomColor: forDelete.contains(index) ? true : false,
                  ),
                ),
              );
            }).toList();
            return Column(
              children: favoriteCards,
            );
          },
        ),
      ),
    );
  }

  Widget _screenTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * defaultPadding,
          horizontal: MediaQuery.of(context).size.width * defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorites',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline4.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w600),
          ),
          Text('Press and hold to select an item',
              style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w300))
        ],
      ),
    );
  }

  Widget _screenBody() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _screenTitle(),
              _builderCardFavorites(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: opacityActive ? 0 : 1,
        duration: Duration(
          milliseconds: animationOpacityTime,
        ),
        child: CustomContainerAnimation(
          animationChildren: animatedContainerActive,
          children: Column(
            children: [
              _screenNavigator(),
              _screenBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class ArrowBackHeaderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: CircleIconButton(
        icon: Icons.arrow_back,
        color: Theme.of(context).primaryColorDark,
        bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
        trigger: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class TrashFavoriteHeaderButton extends StatefulWidget {
  final int amout;
  TrashFavoriteHeaderButton({this.amout});
  @override
  _TrashFavoriteHeaderButtonState createState() =>
      _TrashFavoriteHeaderButtonState();
}

class _TrashFavoriteHeaderButtonState extends State<TrashFavoriteHeaderButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          CircleIconButton(
            icon: Icons.delete,
            color: Theme.of(context).primaryColorDark,
            bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
            trigger: () {
              print(
                  "Comunicarse con el bloque de favoritos y eliminar esto!!!");
            },
          ),
          Positioned(
            top: 2,
            left: 3,
            child: AnimatedContainer(
                duration: Duration(
                  milliseconds: 400,
                ),
                width: widget.amout == 0 || widget.amout == null ? 0 : 16,
                height: widget.amout == 0 || widget.amout == null ? 0 : 16,
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedOpacity(
                  opacity: widget.amout == 0 || widget.amout == null ? 0 : 1,
                  duration: Duration(
                    milliseconds: 700,
                  ),
                  child: Center(
                    child: Text(
                      widget.amout == 0 || widget.amout == null
                          ? ''
                          : widget.amout.toString(),
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: widget.amout >= 10 ? 7 : 9,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColorLight,
                          ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
