class Adittional {
  final String title;
  final bool isMulti;
  List<AditionalsOptions> children;
  Adittional({this.title, this.children, this.isMulti});
}

class AditionalsOptions {
  final String name;
  bool isActive;
  final int price;
  AditionalsOptions({this.name, this.isActive, this.price});
}
