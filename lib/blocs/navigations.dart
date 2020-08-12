import 'dart:async';

class blocNavigations {
  StreamController<String> _previousPageController =
      new StreamController<String>();

  Stream<String> get streamprevious => _previousPageController.stream;

  void setPreviousPage(String page) {
    _previousPageController.sink.add(page);
  }

  void dispose() {
    _previousPageController.close();
  }
}
