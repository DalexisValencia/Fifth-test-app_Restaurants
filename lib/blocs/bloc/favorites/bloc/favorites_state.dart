part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {
  final List<Restaurants>? restaurants;
  final List<Dishes>? dishes;
  final List<dynamic>? selecteds;
  FavoritesInitial({
    this.restaurants,
    this.dishes,
    this.selecteds,
  });

  @override
  List<Object> get props => [restaurants!, dishes!, selecteds!];

  @override
  String toString() =>
      'FavoritesInitial {props: restaurants: $restaurants, dishes: $dishes, Selecteds: $selecteds}';
}

class FavoritesFetched extends FavoritesState {
  final List<Restaurants>? restaurants;
  final List<Dishes>? dishes;
  final List<dynamic>? selecteds;
  FavoritesFetched({
    this.restaurants,
    this.dishes,
    this.selecteds,
  });

  @override
  List<Object> get props => [restaurants!, dishes!, selecteds!];

  @override
  String toString() =>
      'FavoritesFetched {props: restaurants: $restaurants, dishes: $dishes, Selecteds: $selecteds}';
}
