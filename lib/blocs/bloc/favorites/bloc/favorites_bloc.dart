import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/interfaces/Restaurants.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc()
      : super(
          FavoritesInitial(
            restaurants: [],
            dishes: [],
            selecteds: [],
          ),
        );

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    List<Restaurants> restaurantsState = state.props[0] as List<Restaurants>;
    List<Dishes> dishesState = state.props[1] as List<Dishes>;
    List<dynamic> selecteds = state.props[2] as List<dynamic>;
    if (event is FavoriteAddRestaurant) {
      List<Restaurants> resfinal = List.from(restaurantsState);
      if (restaurantsState.contains(event.restaurant)) {
        resfinal..remove(event.restaurant);
      } else if (!restaurantsState.contains(event.restaurant)) {
        resfinal..add(event.restaurant!);
      }
      yield FavoritesFetched(
        restaurants: resfinal,
        dishes: dishesState,
        selecteds: selecteds,
      );
    }

    if (event is FavoriteRemove) {
      List<Restaurants> finalRestaurants = List.from(restaurantsState);
      List<Dishes> finalDishes = List.from(dishesState);
      selecteds.map((e) {
        if (e is Restaurants) {
          finalRestaurants.remove(e);
        }

        if (e is Dishes) {
          finalDishes.remove(e);
        }
      }).toList();

      yield FavoritesFetched(
        restaurants: finalRestaurants,
        dishes: finalDishes,
        selecteds: [],
      );
    }

    if (event is FavoriteAddDish) {
      List<Dishes> dishFinal = List.from(dishesState);
      print(event.dish);
      if (dishesState.contains(event.dish)) {
        dishFinal..remove(event.dish);
      } else if (!dishesState.contains(event.dish)) {
        dishFinal..add(event.dish!);
      }
      yield FavoritesFetched(
        restaurants: restaurantsState,
        dishes: dishFinal,
        selecteds: selecteds,
      );
    }

    if (event is FavoriteSelected) {
      List<dynamic> selectedsFinal = List.from(selecteds);
      if (selectedsFinal.contains(event.selected)) {
        selectedsFinal.remove(event.selected);
      } else if (!selectedsFinal.contains(event.selected)) {
        selectedsFinal.add(event.selected);
      }

      yield FavoritesFetched(
        restaurants: restaurantsState,
        dishes: dishesState,
        selecteds: selectedsFinal,
      );
    }
  }
}
