import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/search.dart';
import 'package:fith_app__restaurant/widgets/quickViewCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  SearchBloc searchBloc;
  @override
  initState() {
    super.initState();
    searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    //Cuando salimos de la vista limpiamos todos los resultados
    searchBloc.add(ClearSearch());
  }

  Widget _seeAll(title, to) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Align(
        child: MaterialButton(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.transparent,
          splashColor: Theme.of(context).splashColor,
          onPressed: () {},
          child: Text(
            title,
            style: Theme.of(context).textTheme.caption.copyWith(
                decoration: TextDecoration.underline,
                color: Theme.of(context).primaryColorDark),
          ),
        ),
      ),
    );
  }

  Widget _totalregisters(registers) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 5),
      child: Align(
          alignment: Alignment.topRight,
          child: Text(registers,
              style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w400))),
    );
  }

  Widget _recentSearch() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Recents",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              List<Widget> recent = [];
              recent.add(_totalregisters('Recents 3 of 20'));
              dishes.map((e) {
                recent.add(Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  // child: AsaCard(color: Colors.blue),
                  child: QuickView(dish: e),
                ));
              }).toList();
              recent.add(_seeAll('See all recents', 'recente-search'));
              return Column(
                children: recent,
              );
            },
          )
        ],
      ),
    );
  }

  Widget _results() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        SearchInitInterface stateSearchResults = state.props[0];
        print(stateSearchResults.results);
        return stateSearchResults.results.length >= 1
            ? Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Results",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    Builder(
                      builder: (BuildContext context) {
                        List<Widget> recent = [];
                        recent.add(_totalregisters('Results 3 of 40'));
                        stateSearchResults.results.map((e) {
                          recent.add(Container(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: QuickView(dish: e)));
                        }).toList();
                        // recent.add(_seeAll('See all results', 'recente-search'));
                        return Column(
                          children: recent,
                        );
                      },
                    )
                  ],
                ),
              )
            : SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding = totalWidth * defaultPadding;
    return BlocProvider(
      create: (BuildContext context) => DishBloc(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: withDefaultPadding),
        height: MediaQuery.of(context).viewInsets.bottom > 1
            ? (MediaQuery.of(context).viewInsets.bottom -
                    (MediaQuery.of(context).size.height - 40))
                .abs()
            : MediaQuery.of(context).size.height - 40,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            _results(),
            _recentSearch(),
            SizedBox(
              height: 50,
            )
          ],
        )),
      ),
    );
  }
}
