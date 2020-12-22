import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc()
      : super(
          FavoritesInitial(
            restaurants: [],
            dishes: [],
          ),
        );

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    List<Restaurants> restaurantsState = state.props[0];
    List<Dishes> dishesState = state.props[1];
    if (event is FavoriteAddRestaurant) {
      List<Restaurants> resfinal = List.from(restaurantsState);
      yield FavoritesFetched(
        restaurants: resfinal..add(event.restaurant),
        dishes: dishesState,
      );
    }

    if (event is FavoriteRemoveRestaurant) {
      print("remover este restaurante:");
      print(event.restaurant);
    }

    if (event is FavoriteAddDish) {
      List<Dishes> dishFinal = List.from(dishesState);
      yield FavoritesFetched(
        restaurants: restaurantsState,
        dishes: dishFinal..add(event.dish),
      );
    }

    if (event is FavoriteRemoveDish) {
      print("remover este restaurante:");
      print(event.dish);
    }
  }
}
