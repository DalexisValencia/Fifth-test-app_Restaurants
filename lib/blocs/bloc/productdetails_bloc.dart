import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'productdetails_event.dart';
part 'productdetails_state.dart';

class ProductdetailsBloc
    extends Bloc<ProductdetailsEvent, ProductdetailsState> {
  ProductdetailsBloc() : super(ProductdetailsInitial());

  @override
  Stream<ProductdetailsState> mapEventToState(
    ProductdetailsEvent event,
  ) async* {
    if (event is ProductdetailsCurrent) {
      print(state);
      print(event.product);
      yield ProductDetailCurrent(product: event.product);
    }
  }
}
