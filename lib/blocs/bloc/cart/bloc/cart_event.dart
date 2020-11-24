part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetAllItems extends CartEvent {}

class AddToCart extends CartEvent {
  final Dishes dish;
  AddToCart({this.dish});

  @override
  List<Object> get props => [dish];
}

class DeleteFromCart extends CartEvent {
  final List<int> toDelete;
  DeleteFromCart({this.toDelete});
  @override
  List<Object> get props => [toDelete];
}

class UpdatedAmount extends CartEvent {
  final Dishes dish;
  UpdatedAmount({this.dish});
}

class ClearAll extends CartEvent {}
