part of 'productdetails_bloc.dart';

@immutable
abstract class ProductdetailsState {
  const ProductdetailsState();

  @override
  List<Object> get props => [];
}

class ProductdetailsInitial extends ProductdetailsState {
  // final product;
  // ProductdetailsInitial({this.product});

  // @override
  // List<Object> get props => [product];

  // @override
  // String toString() => 'TodosInitial { favoritos: $product}';
}

class ProductDetailCurrent extends ProductdetailsState {
  final product;
  ProductDetailCurrent({this.product});

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'ProductDetailCurrent { favoritos: $product}';
}
