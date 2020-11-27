import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(
          CartblocInitial(
            dishes: [],
            total: 0,
          ),
        );

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    List<Dishes> stateDishesCart = state.props[0];
    if (event is AddToCart) {
      List<Dishes> finaldishes = List.from(stateDishesCart)..add(event.dish);
      yield FetchItems(
        dishes: finaldishes,
        total: _getTodal(finaldishes),
      );
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
        total: 0,
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
      int pricePerAmount = event.dish.price.toInt() * amountCurrent;
      int promocionalPrice = _getPromotionlaPrices(event.dish, amountCurrent);
      int discount =
          promocionalPrice == 0 ? 0 : promocionalPrice - (pricePerAmount);
      event.dish.amount = amountCurrent;
      event.dish.finalPrice =
          (promocionalPrice == 0 ? pricePerAmount : promocionalPrice) +
              _getAdditionalPrice(event.dish);
      event.dish.promotionLabel.discounts = discount.toDouble().abs();
      // print("precio promocional");
      // print(promocionalPrice);
      // print(event.dish.finalPrice);
      // print("precio promocional");
      Dishes currentPlate = event.dish.copyWith(event.dish);
      List<Dishes> copyListDishes = List.from(stateDishesCart)
        ..removeAt(indexFound);
      List<Dishes> finaldishes = List.from(copyListDishes)
        ..insert(indexFound, currentPlate);
      yield FetchItems(
        dishes: finaldishes,
        total: _getTodal(finaldishes),
      );
    }
  }
}

double _getTodal(List<Dishes> cartiItems) {
  double total = 0;
  cartiItems.map((e) {
    total += e.finalPrice;
  }).toList();
  return total;
}

double _getAdditionalPrice(Dishes dish) {
  double addtionalPrices = 0;
  if (dish.additions.isNotEmpty) {
    dish.additions.map((e) {
      Iterable<AditionalsOptions> additioonals =
          e.children.where((element) => element.isActive == true);
      if (additioonals.isNotEmpty) {
        for (var aditional in additioonals) {
          addtionalPrices += aditional.price;
        }
      }
    }).toList();
  }
  return addtionalPrices;
}

int _getPromotionlaPrices(Dishes dish, int amount) {
  int promotionPrices = 0;
  if (dish.promotionLabel.pricePromotions.isNotEmpty) {
    Iterable<PricePromotions> promotionsPrice = dish
        .promotionLabel.pricePromotions
        .where((element) => element.amount == amount);
    if (promotionsPrice.isNotEmpty) {
      promotionPrices = promotionsPrice.first.price;
    }
  }
  return promotionPrices;
}
