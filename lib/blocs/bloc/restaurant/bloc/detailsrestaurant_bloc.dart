import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurants/interfaces/Restaurants.dart';

part 'detailsrestaurant_event.dart';
part 'detailsrestaurant_state.dart';

class DetailsrestaurantBloc
    extends Bloc<DetailsrestaurantEvent, DetailsrestaurantState> {
  DetailsrestaurantBloc() : super(DetailsrestaurantInitial());

  @override
  Stream<DetailsrestaurantState> mapEventToState(
    DetailsrestaurantEvent event,
  ) async* {
    if (event is DetailsresturantSetCurrent) {
      yield DetailsrestaurantCurrent(restaurant: event.restaurant);
    }
  }
}
