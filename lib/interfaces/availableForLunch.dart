import 'package:flutter/material.dart';

class AvailablePlatesForLunch {
  final String? flagLabelText;
  final Color? flagLabelColor;
  final String? imagePlate;
  final String? price;
  final String? plateName;
  final int? starts;
  final String? qualifiers;
  final String? votes;
  final String? preparationTime;
  final List<PricesShip>? prices; // limit 3
  AvailablePlatesForLunch(
      {this.flagLabelText,
      this.flagLabelColor,
      this.imagePlate,
      this.price,
      this.plateName,
      this.starts,
      this.qualifiers,
      this.votes,
      this.preparationTime,
      this.prices});
}

class PricesShip {
  final int? amount;
  final String? price;
  final bool? active;
  PricesShip({
    this.amount,
    this.price,
    this.active,
  });
}
