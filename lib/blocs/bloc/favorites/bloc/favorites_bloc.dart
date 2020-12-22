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
      if (restaurantsState.contains(event.restaurant)) {
        resfinal..remove(event.restaurant);
      } else if (!restaurantsState.contains(event.restaurant)) {
        resfinal..add(event.restaurant);
      }
      yield FavoritesFetched(
        restaurants: resfinal,
        dishes: dishesState,
      );
    }

    if (event is FavoriteRemoveRestaurant) {
      print("remover este restaurante:");
      print(event.restaurant);
    }

    if (event is FavoriteAddDish) {
      List<Dishes> dishFinal = List.from(dishesState);
      if (dishesState.contains(event.dish)) {
        dishFinal..remove(event.dish);
      } else if (!dishesState.contains(event.dish)) {
        dishFinal..add(event.dish);
      }
      yield FavoritesFetched(
        restaurants: restaurantsState,
        dishes: dishFinal,
      );
    }

    if (event is FavoriteRemoveDish) {
      print("remover este restaurante:");
      print(event.dish);
    }
  }
}
