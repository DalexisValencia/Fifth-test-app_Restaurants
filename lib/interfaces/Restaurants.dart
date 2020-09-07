import 'package:fith_app__restaurant/interfaces/Comments.dart';
import 'package:fith_app__restaurant/interfaces/ContactMeans.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/categories.dart';
import 'package:flutter/material.dart';

class Restaurants {
  final String name;
  final String description;
  final String image;
  final int rating;
  final IconData type;
  final List location;
  final String distance;
  final List<Dishes> lunchNow;
  final List tagsMenu; // champiñones
  final List<Dishes> menu; // All menu
  final List<Dishes> suggestions; // menu sections importants
  final List<Dishes> highlight; // menu best ratings
  final List<String> socialShare;
  final List<ContactMeans> contact;
  final List<Comments> comments;
  final String schedule;
  final List<Category> categories;

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
