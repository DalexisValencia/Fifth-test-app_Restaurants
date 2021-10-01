import 'package:fith_app__restaurant/blocs/bloc/additional/additionals_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishSummary extends StatefulWidget {
  @override
  _DishSummaryState createState() => _DishSummaryState();
}

class _DishSummaryState extends State<DishSummary> {
  List<Adittional>? allAdditionals;
  @override
  initState() {
    super.initState();
  }

  Widget _header() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07,
            bottom: 10),
        child: Text(
          "Summary",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark),
        ));
  }

  Widget _body() {
    return BlocBuilder<AdditionalsBloc, AdditionalsState>(
      builder: (BuildContext context, AdditionalsState state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * defaultPadding),
          child: Row(
            mainAxisAlignment: state.props[1] != 0
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _card('Cooking', '20 min', Icons.watch_later),
              state.props[1] != 0
                  ? _card(
                      'Extra',
                      '\$${formatterPrice(state.props[1]).toString()}',
                      Icons.monetization_on)
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
              _card('Discount', '-\$5.000', Icons.remove_circle),
            ],
          ),
        );
      },
    );
  }

  Widget _card(name, value, icon) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                size: 12,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_header(), _body()],
    );
  }
}
