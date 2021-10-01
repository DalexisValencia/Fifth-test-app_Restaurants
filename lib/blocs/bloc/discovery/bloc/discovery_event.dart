part of 'discovery_bloc.dart';

abstract class DiscoveryEvent extends Equatable {
  const DiscoveryEvent();

  @override
  List<Object> get props => [];
}

class DiscoveryStart extends DiscoveryEvent {
  final String? category;
  DiscoveryStart({this.category});
}
