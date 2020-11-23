part of 'cartbloc_bloc.dart';

abstract class CartblocState extends Equatable {
  const CartblocState();

  @override
  List<Object> get props => [];
}

class CartblocInitial extends CartblocState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DishCurrent {Search by: vacio}';
}

class FetchItems extends CartblocState {
  final List<Dishes> dishes;
  FetchItems({this.dishes});

  @override
  List<Object> get props => [dishes];

  @override
  String toString() => 'CartblocState {Search by: $dishes}';
}
