part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartblocInitial extends CartState {
  final List<Dishes> dishes;
  final double total;
  // final List<int> dishes;
  CartblocInitial({
    this.dishes,
    this.total,
  });
  @override
  List<Object> get props => [dishes, total];

  @override
  String toString() => 'CartblocInitial {List of Dishes: $dishes && $total}';
}

class FetchItems extends CartState {
  // final List<int> dishes;
  final List<Dishes> dishes;
  final double total;
  FetchItems({
    this.dishes,
    this.total,
  });

  @override
  List<Object> get props => [dishes, total];

  @override
  String toString() => 'FetchItems {List of Dishes: $dishes && $total}';
}
