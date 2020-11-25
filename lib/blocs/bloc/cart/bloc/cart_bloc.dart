import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartblocInitial(dishes: []));

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    List<Dishes> stateDishesCart = state.props[0];
    if (event is AddToCart) {
      List<Dishes> finaldishes = List.from(stateDishesCart)..add(event.dish);
      yield FetchItems(dishes: finaldishes);
    }

    if (event is DeleteFromCart) {
      List<Dishes> finaldishes = List.from(stateDishesCart);
      if (event.toDelete.length >= 1) {
        stateDishesCart.asMap().entries.map((e) {
          if (event.toDelete.contains(e.key)) {
            finaldishes.removeAt(e.key);
          }
        }).toList();
      }
      // Cuando solo sea uno
      else if (event.toDelete.length == 1) {
        finaldishes.removeAt(0);
      }
      yield FetchItems(
        dishes: finaldishes,
      );
    }

    if (event is GetAllItems) {
      // yield FetchItems(dishes: finalDishes);
    }

    if (event is ClearAll) {
      // yield FetchItems(dishes: []);
    }

    if (event is UpdateAmount) {
      int amountCurrent = event.dish.amount;
      int indexFound = stateDishesCart.indexOf((event.dish));
      switch (event.action) {
        case 'add':
          amountCurrent += 1;
          break;
        case 'remove':
          amountCurrent = amountCurrent > 0 ? amountCurrent - 1 : 1;
          break;
        default:
      }
      event.dish.amount = amountCurrent;
      Dishes currentPlate = event.dish.copyWith(event.dish);
      List<Dishes> finaldishes = List.from(stateDishesCart)
        ..removeAt(indexFound);
      yield FetchItems(
        dishes: List.from(finaldishes)..insert(indexFound, currentPlate),
      );
    }
  }
}
