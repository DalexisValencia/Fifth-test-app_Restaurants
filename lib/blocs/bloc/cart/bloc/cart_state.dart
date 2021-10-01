part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartblocInitial extends CartState {
  final List<Dishes>? dishes;
  final double? total;
  final int? amount;
  final List<Dishes>? selecteds;
  // final List<int> dishes;
  CartblocInitial({
    this.dishes,
    this.total,
    this.amount,
    this.selecteds,
  });
  @override
  List<Object> get props => [
        dishes!,
        total!,
        amount!,
        selecteds!,
      ];

  @override
  String toString() =>
      'CartblocInitial {List of Dishes: $dishes && $total && $amount && $selecteds}';
}

class FetchItems extends CartState {
  // final List<int> dishes;
  final List<Dishes>? dishes;
  final double? total;
  final int? amount;
  final List<Dishes>? selecteds;
  FetchItems({
    this.dishes,
    this.total,
    this.amount,
    this.selecteds,
  });

  @override
  List<Object> get props => [
        dishes!,
        total!,
        amount!,
        selecteds!,
      ];

  @override
  String toString() =>
      'FetchItems {List of Dishes: $dishes && $total && $amount && $selecteds}';
}
