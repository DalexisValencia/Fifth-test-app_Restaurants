import 'dart:async';

class BlocNavigations {
  var _initial = "leave";
  String get initial => _initial;

  StreamController<String> _previousPageController =
      new StreamController<String>.broadcast();

  Stream<String> get streamprevious => _previousPageController.stream;

  void setPreviousPage(String page) {
    _previousPageController.sink.add(page);
  }

  void dispose() {
    _previousPageController.close();
  }
}
