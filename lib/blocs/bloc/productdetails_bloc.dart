import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fith_app__restaurant/Lists/menu.dart';
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
      // print(state);
      // print('abajo los productos');
      // print(dishes);
      // print(event.product);
      expampleTest(event.product);

      // .where((element) => element.category.indexOf(event.product) != -1);
      // print("find me");
      // print(dishesFinales);
      yield ProductDetailCurrent(product: event.product);
    }
  }
}

expampleTest(name) {
  print('hi pretties');
  // print(name);
  // print(dishes);
  var paltes = dishes.where((item) {
    // print(item.category.where((category) => category.name == name));
    // var ixis = item.category.where((category) {
    //   return category.name == name;
    // }).toList();
    // // print(ixis.length);
    // return ixis.length == 1; //item.category.contains(name);
    return true;
  }).toList();
  print(paltes);
  // var dishesFinales = dishes.where((element) {
  //   print(element.category);
  //   return true;
  // });
  print('bye pretties');
}
