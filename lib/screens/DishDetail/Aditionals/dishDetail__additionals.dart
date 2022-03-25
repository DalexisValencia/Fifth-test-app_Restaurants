import 'package:restaurants/blocs/bloc/additional/additionals_bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/aditional.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/screens/DishDetail/Aditionals/dishDetail__additionals--expansionPanel.dart';

class Aditionals extends StatefulWidget {
  final List<Adittional>? aditionals;
  Aditionals({
    this.aditionals,
  });
  @override
  AditionalsState createState() => AditionalsState();
}

class AditionalsState extends State<Aditionals> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<AdditionalsBloc>(context).add(
      AdditionalsPopulate(
        additionals: widget.aditionals,
      ),
    );
  }

  Widget _header() {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.018,
        top: MediaQuery.of(context).size.height * 0.005,
      ),
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Aditionals",
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark,
            ),
      ),
    );
  }

  Widget _expansionAdittional() {
    return BlocBuilder<AdditionalsBloc, AdditionalsState>(
      builder: (BuildContext context, state) {
        List<Adittional> states = state.props[0] as List<Adittional>;
        return states.length == 0
            ? Text("loading")
            : Builder(
                builder: (BuildContext context) {
                  List<Widget> expandible = [];
                  states.asMap().entries.map(
                    (item) {
                      expandible.add(
                        AditionalExpansionPanel(
                          index: item.key,
                          additional: item.value,
                        ),
                      );
                    },
                  ).toList();

                  return Column(
                    children: expandible,
                  );
                },
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.07,
        right: MediaQuery.of(context).size.width * 0.07,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          _header(),
          _expansionAdittional(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
