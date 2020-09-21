import 'dart:async';

import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  DishBloc() : super(DishInitial());

  @override
  Stream<DishState> mapEventToState(DishEvent event) async* {
    if (event is DishStart) {
      var foundDish = findInDishes(event.dishName);
      yield DishCurrent(dish: foundDish);
    }
  }
}

findInDishes(name) {
  Iterable<Dishes> dish = dishes.where((element) {
    return element.name == name;
  });
  Dishes finalDish = dish.map((e) => e).toList()[0];
  return finalDish;
}
