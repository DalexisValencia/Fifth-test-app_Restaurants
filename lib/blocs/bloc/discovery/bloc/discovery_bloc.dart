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
  List<Dishes> platos = dishes.where((dish) {
    return dish.category.indexOf(name) != -1;
  }).toList();

  List<Restaurants> resta = restaurants.where((item) {
    return item.categories.indexOf(name) != -1;
  }).toList();
  Discovery discoveryView = Discovery(
    name: name,
    near: platos,
    newLaunch: dishes,
    restaurants: resta,
  );

  return discoveryView;
}
