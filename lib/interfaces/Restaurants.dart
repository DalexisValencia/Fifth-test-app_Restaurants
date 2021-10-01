import 'package:restaurants/interfaces/Comments.dart';
import 'package:restaurants/interfaces/ContactMeans.dart';
import 'package:restaurants/interfaces/Dishes.dart';
// import 'package:restaurants/interfaces/categories.dart';
import 'package:flutter/material.dart';

class Restaurants {
  final String? name;
  final String? description;
  final String? image;
  final int? rating;
  final IconData? type;
  final List? location;
  final String? distance;
  final List<Dishes>? lunchNow;
  final List<String>? tagsMenu; // Restaurant Tags
  final List<Dishes>? menu; // All menu
  final List<Dishes>? suggestions; // menu sections importants
  final List<Dishes>? highlight; // menu best ratings
  final List<String>? socialShare;
  final List<ContactMeans>? contact;
  final List<Comments>? comments;
  final String? schedule;
  final List<String>? categories;

  Restaurants(
      {this.name,
      this.description,
      this.image,
      this.rating,
      this.type,
      this.location,
      this.distance,
      this.lunchNow,
      this.tagsMenu,
      this.menu,
      this.suggestions,
      this.highlight,
      this.socialShare,
      this.contact,
      this.comments,
      this.schedule,
      this.categories});
}
