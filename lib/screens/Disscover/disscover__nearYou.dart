import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/dishCard/nearyou/nearYouCard.dart';
import 'package:restaurants/sections/empty/emtpySection.dart';
import 'package:restaurants/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NearYou extends StatefulWidget {
  final List<Dishes>? nearYou;
  NearYou({
    this.nearYou,
  });
  @override
  _NearYouState createState() => _NearYouState();
}

class _NearYouState extends State<NearYou> {
  Widget _horizontalScrollList() {
    return BlocProvider(
      create: (BuildContext context) => DishBloc(),
      child: Container(
        height: 160,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * defaultPadding,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.nearYou!.length,
          itemBuilder: (BuildContext context, int index) {
            return NearYouCard(
              dish: widget.nearYou![index],
              index: index,
            );
          },
        ),
      ),
    );
  }

  _sectionBody() {
    if (widget.nearYou!.length == 0) {
      return EmptySections();
    }
    if (widget.nearYou!.length >= 1) {
      return _horizontalScrollList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SeeAllSuggested(
          title: "Near you",
        ),
        _sectionBody(),
      ],
    );
  }
}
