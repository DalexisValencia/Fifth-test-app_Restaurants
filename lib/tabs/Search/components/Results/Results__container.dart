import 'package:restaurants/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:restaurants/interfaces/search.dart';
import 'package:restaurants/tabs/Search/components/Results/components/Results__title.dart';
import 'package:restaurants/widgets/dishCard/normal/dishCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        SearchInitInterface stateSearchResults =
            state.props[0] as SearchInitInterface;
        return stateSearchResults.results!.length >= 1
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
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    Builder(
                      builder: (BuildContext context) {
                        List<Widget> recent = [];
                        recent.add(
                          ResultsTitle(
                            showing: '1',
                            total: '10',
                          ),
                        );
                        stateSearchResults.results!.map((e) {
                          recent.add(
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: DishCard(
                                dish: e,
                              ),
                            ),
                          );
                        }).toList();
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
}
