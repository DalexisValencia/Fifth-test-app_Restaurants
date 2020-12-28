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

class FavoriteRemove extends FavoritesEvent {
  final List<dynamic> toDelete;
  FavoriteRemove({this.toDelete});
}

class FavoriteAddDish extends FavoritesEvent {
  final Dishes dish;
  FavoriteAddDish({this.dish});
}
