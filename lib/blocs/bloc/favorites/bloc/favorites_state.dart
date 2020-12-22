part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {
  final List<Restaurants> restaurants;
  final List<Dishes> dishes;
  FavoritesInitial({
    this.restaurants,
    this.dishes,
  });

  @override
  List<Object> get props => [restaurants, dishes];

  @override
  String toString() =>
      'FavoritesInitial {props: restaurants: $restaurants, dishes: $dishes}';
}

class FavoritesFetched extends FavoritesState {
  final List<Restaurants> restaurants;
  final List<Dishes> dishes;
  FavoritesFetched({
    this.restaurants,
    this.dishes,
  });

  @override
  List<Object> get props => [restaurants, dishes];

  @override
  String toString() =>
      'FavoritesFetched {props: restaurants: $restaurants, dishes: $dishes}';
}
