import 'dart:async';

import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  DishBloc() : super(DishInitial());

  @override
  Stream<DishState> mapEventToState(DishEvent event) async* {
    if (event is DishStart) {
      // var foundDish = findInDishes(event.currentDish);
      yield DishCurrent(dish: event.currentDish);
    }

    if (event is DishModifierEdit) {
      //event.currentModifier.isActive = true;
      AditionalsOptions adpush = event.currentModifier;
      Dishes platos = state.props[0];
      platos.additions[0].children.add(adpush);
      print(platos.additions[0].children.length);
      yield DishCurrent(dish: platos);
      // print(state.props[0]);
      // print("El elemento padre donde buscar");
      // print(event.modifierParent);
      // print("Instancia de los platos");
      // print(event.currentModifier);
      // yield DishCurrent(
      //     dish: findModifierPropInModifierOption(
      //         state.props[0], event.currentModifier));
    }
  }

  // @override
  // void onChange(Change<DishState> change) {
  //   print(change);
  //   print("look above");
  //   super.onChange(change);
  // }
}

// findModifierPropInModifierOption(
//     Dishes currentDish, AditionalsOptions currentProp) {
//   currentDish.additions[indParent].children.add(currentProp);
//   print(currentDish.additions[indParent].children.length);
//   return currentDish;
// print("a buscar: ${currentProp.name}");
// Iterable<AditionalsOptions> adition = currentDish.additions[indParent].children
//     .where((element) => currentProp.name == element.name);
// print(currentDish.additions[indParent].children
//     .where((element) => currentProp.name == element.name));
// }

// findInDishes(name) {
//   Iterable<Dishes> dish = dishes.where((element) {
//     return element.name == name;
//   });
//   Dishes finalDish = dish.map((e) => e).toList()[0];
//   return finalDish;
// }
