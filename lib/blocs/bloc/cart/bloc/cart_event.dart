part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetAllItems extends CartEvent {}

class AddToCart extends CartEvent {
  final Dishes dishToCart;
  AddToCart({this.dishToCart});

  @override
  List<Object> get props => [dishToCart];
}

class DeleteFromCart extends CartEvent {
  final String name;
  DeleteFromCart({this.name});
}

class UpdatedAmount extends CartEvent {
  final Dishes dish;
  UpdatedAmount({this.dish});
}

class ClearAll extends CartEvent {}
