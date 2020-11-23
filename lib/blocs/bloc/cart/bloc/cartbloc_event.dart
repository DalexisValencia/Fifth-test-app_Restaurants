part of 'cartbloc_bloc.dart';

abstract class CartblocEvent extends Equatable {
  const CartblocEvent();

  @override
  List<Object> get props => [];
}

class GetAllItems extends CartblocEvent {}

class AddToCart extends CartblocEvent {
  final Dishes dishToCart;
  AddToCart({this.dishToCart});
}

class DeleteFromCart extends CartblocEvent {
  final String name;
  DeleteFromCart({this.name});
}

class UpdatedAmount extends CartblocEvent {
  final Dishes dish;
  UpdatedAmount({this.dish});
}
