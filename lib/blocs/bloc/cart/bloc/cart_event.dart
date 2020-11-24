part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetAllItems extends CartEvent {}

class AddToCart extends CartEvent {
  // final Dishes dishToCart;
  final int dish;
  AddToCart({this.dish});

  @override
  List<Object> get props => [dish];
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
