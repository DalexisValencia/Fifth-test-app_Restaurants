import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/interfaces/Discovery.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';

part 'discovery_event.dart';
part 'discovery_state.dart';

class DiscoveryBloc extends Bloc<DiscoveryEvent, DiscoveryState> {
  DiscoveryBloc() : super(DiscoveryInitial());

  @override
  Stream<DiscoveryState> mapEventToState(
    DiscoveryEvent event,
  ) async* {
    if (event is DiscoveryStart) {
      Discovery discoveryResult = completeDiscovery(event.category);
      yield DiscoveryCurrent(discovery: discoveryResult);
    }
  }
}

completeDiscovery(name) {
  List<Dishes> platos = dishes.where((item) {
    var ixis = item.category.where((category) {
      return category.name == name;
    }).toList();
    return ixis.length == 1; //item.category.contains(name);
  }).toList();

  List<Restaurants> restaurantes = restaurants
    ..where((item) {
      var ixis = item.categories.where((category) {
        return category.name == name;
      }).toList();
      return ixis.length == 1; //item.category.contains(name);
    }).toList();
  Discovery discoveryView = Discovery(
    name: name,
    popular: platos,
    newLaunch: [],
    restaurants: restaurantes,
  );

  return discoveryView;

  // print(discoveryView);
}
