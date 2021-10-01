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
    SearchInitInterface searchState = state.props[0] as SearchInitInterface;
    if (event is SearchInit) {
      yield SearchInitial(initial: assembleInitial(event.findIn));
    }
    if (event is Searching) {
      yield SearchInitial(
          initial: SearchInitInterface(
              suggestions: dishes,
              popular: dishes,
              highlightRestaurants: restaurants,
              results: dishes,
              findIn: searchState.findIn));
    }
    if (event is ClearSearch) {
      //print(searchState);
      yield SearchInitial(
          initial: SearchInitInterface(
              suggestions: dishes,
              popular: dishes,
              highlightRestaurants: restaurants,
              results: [],
              findIn: searchState.findIn));
    }
  }
}

assembleInitial(findIn) {
  SearchInitInterface initialSearch = SearchInitInterface(
      suggestions: dishes,
      popular: dishes,
      highlightRestaurants: restaurants,
      results: [],
      findIn: findIn);

  return initialSearch;
}
