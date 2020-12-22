part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoriteAddRestaurant extends FavoritesEvent {
  final Restaurants restaurant;
  FavoriteAddRestaurant({this.restaurant});
}

class FavoriteRemoveRestaurant extends FavoritesEvent {
  final Restaurants restaurant;
  FavoriteRemoveRestaurant({this.restaurant});
}

class FavoriteAddDish extends FavoritesEvent {
  final Dishes dish;
  FavoriteAddDish({this.dish});
}

class FavoriteRemoveDish extends FavoritesEvent {
  final Dishes dish;
  FavoriteRemoveDish({this.dish});
}
