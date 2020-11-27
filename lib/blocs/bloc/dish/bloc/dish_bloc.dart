import 'dart:async';

import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  DishBloc() : super(DishEmpty());

  @override
  Stream<DishState> mapEventToState(DishEvent event) async* {
    if (event is DishStart) {
      var foundDish = Dishes().copyWith(event.currentDish);
      yield DishCurrent(
        dish: foundDish,
      );
    }

    if (event is DishModifierEdit) {
      AditionalsOptions adpush = event.currentModifier;
      Dishes platos = state.props[0];
      platos.additions[0].children.add(adpush);
      yield DishCurrent(dish: platos);
    }

    if (event is DishClean) {
      yield DishEmpty();
    }
  }

  // @override
  // void onChange(Change<DishState> change) {
  //   print(change);
  //   print("look above");
  //   super.onChange(change);
  // }
}
