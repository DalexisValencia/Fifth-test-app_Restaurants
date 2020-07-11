class Adittional {
  final String title;
  final bool isMulti;
  List<AditionalsOptions> children;
  Adittional({this.title, this.children, this.isMulti});
}

class AditionalsOptions {
  final String name;
  final bool isActive;
  AditionalsOptions({this.name, this.isActive});
}
