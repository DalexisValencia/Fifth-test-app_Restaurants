import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/tabs/Search/components/Results/Results__container.dart';
import 'package:fith_app__restaurant/tabs/Search/components/Results/Results__recents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  late SearchBloc searchBloc;
  @override
  initState() {
    super.initState();
    searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    searchBloc.add(
      ClearSearch(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding = totalWidth * defaultPadding;
    return BlocProvider(
      create: (BuildContext context) => DishBloc(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: withDefaultPadding,
        ),
        height: MediaQuery.of(context).viewInsets.bottom > 1
            ? (MediaQuery.of(context).viewInsets.bottom -
                    (MediaQuery.of(context).size.height - 40))
                .abs()
            : MediaQuery.of(context).size.height - 40,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ResultsContainer(),
              ResultRecents(),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
