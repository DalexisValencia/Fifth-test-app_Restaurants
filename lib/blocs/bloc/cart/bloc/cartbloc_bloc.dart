import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';

part 'cartbloc_event.dart';
part 'cartbloc_state.dart';

class CartblocBloc extends Bloc<CartblocEvent, CartblocState> {
  CartblocBloc() : super(CartblocInitial());

  @override
  Stream<CartblocState> mapEventToState(
    CartblocEvent event,
  ) async* {
    List<Dishes> finalDishes = [];
    if (event is AddToCart) {
      //Si existe un elemento similar añadimos 1(cantidad al existente)
      finalDishes.add(event.dishToCart);
      yield FetchItems(dishes: finalDishes);
    }
  }
}
