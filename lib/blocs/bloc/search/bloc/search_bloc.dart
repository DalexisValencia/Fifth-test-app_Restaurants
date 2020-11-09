import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/interfaces/search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchInit) {
      yield SearchInitial(initial: assembleInitial());
    }
  }
}

assembleInitial() {
  SearchInitInterface initialSearch = SearchInitInterface(
      suggestions: dishes, popular: dishes, highlightRestaurants: restaurants);

  return initialSearch;
}
