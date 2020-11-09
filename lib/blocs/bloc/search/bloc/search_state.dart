part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  final SearchInitInterface initial;

  SearchInitial({this.initial});

  @override
  List<Object> get props => [this.initial];

  @override
  String toString() => 'SearchInitial {props: $initial}';
}
