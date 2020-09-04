part of 'productdetails_bloc.dart';

@immutable
abstract class ProductdetailsEvent {}

class ProductdetailsStart extends ProductdetailsEvent {
  final product;
  ProductdetailsStart({this.product});
}

class ProductdetailsCurrent extends ProductdetailsEvent {
  final product;
  ProductdetailsCurrent({this.product});
}
