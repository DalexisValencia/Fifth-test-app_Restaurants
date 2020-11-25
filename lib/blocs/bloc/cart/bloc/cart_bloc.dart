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
      // print("dentro del bloque");
      // print(event.toDelete);
      if (event.toDelete.length >= 1) {
        stateDishesCart.asMap().entries.map((e) {
          // print(event.toDelete.contains(e.key));
          if (event.toDelete.contains(e.key)) {
            // print("deberiamos eliminar el " + e.key.toString());
            finaldishes.removeAt(e.key);
          }
        }).toList();
      } else if (event.toDelete.length == 1) {
        // print("cuando seam solo uno");
        finaldishes.removeAt(0);
      }
      // print(finaldishes);
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

      Dishes currentPlate = Dishes(
        name: event.dish.name,
        details: event.dish.details,
        image: event.dish.image,
        price: event.dish.price,
        rating: event.dish.rating,
        preparation: event.dish.preparation,
        comments: event.dish.comments,
        category: event.dish.category,
        additions: event.dish.additions,
        ingredients: event.dish.ingredients,
        amount: amountCurrent,
        promotionLabel: event.dish.promotionLabel,
      );
      List<Dishes> finaldishes = List.from(stateDishesCart)
        ..removeAt(indexFound);
      yield FetchItems(
        dishes: List.from(finaldishes)..insert(indexFound, currentPlate),
      );
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
