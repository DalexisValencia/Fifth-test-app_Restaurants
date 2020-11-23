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
      stateDishesCart.add(event.dishToCart);
      // // print(state.props[0]);
      // // List<Dishes> finalDishes = state.props;
      // // //Si existe un elemento similar añadimos 1 a cantidad al existente.
      // // finalDishes.add(event.dishToCart);
      // // // print("::::");
      // // // print(event.dishToCart == finalDishes[0]);
      // // // print("::::");
      // // print(finalDishes);
      // // amountInDish('add', event.dishToCart);
      // print(stateDishesCart);
      yield FetchItems(dishes: stateDishesCart);
    }
    print(state);

    if (event is GetAllItems) {
      // yield FetchItems(dishes: finalDishes);
    }

    if (event is ClearAll) {
      // yield FetchItems(dishes: []);
    }
  }
}

// we pass action(add or remove)
void amountInDish(String action, Dishes dish) {
  List<PricePromotions> promotions = dish.promotionLabel.pricePromotions;
  int dishAmount = dish.amount;
  // dish.promotionLabel.pricePromotions; //Array
  // dish.price;
  switch (action) {
    case 'add':
      dishAmount += 1;
      break;
    case 'remove':
      dishAmount = dish.amount == 0 ? 0 : -1;
      break;
    default:
  }
  if (promotions.length >= 1 && promotions != null) {
    // var find = promotions.firstWhere((element) => element.amount == dishAmount);
    // print("este elemento tiene precio de promociones");
    // print(promotions);
    promotions.firstWhere((element) {
      // print(element.amount);
      return element.amount == 2;
    });
  } else if (promotions.length == 0 && promotions == null) {
    dish.price = dish.price * dishAmount;
  }

  dish.amount = dishAmount;
  // print(dish.amount);
}
