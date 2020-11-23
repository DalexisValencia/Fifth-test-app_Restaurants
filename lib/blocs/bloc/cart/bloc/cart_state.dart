part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartblocInitial extends CartState {
  final List<Dishes> dishes;
  CartblocInitial({this.dishes});
  @override
  List<Object> get props => [dishes];

  @override
  String toString() => 'CartblocInitial {Search by: $dishes}';
}

class FetchItems extends CartState {
  final List<Dishes> dishes;
  FetchItems({this.dishes});

  @override
  List<Object> get props => [dishes];

  @override
  String toString() => 'FetchItems {Search by: $dishes}';
}
