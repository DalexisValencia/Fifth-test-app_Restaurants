import 'package:fith_app__restaurant/interfaces/Comments.dart';
import 'package:fith_app__restaurant/interfaces/ContactMeans.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/interfaces/categories.dart';
import 'package:flutter/material.dart';

List<Category> categories = [
  Category('Break Fast', Icons.store_mall_directory,
      'assets/home-categories/category-1.png'),
  Category(
      'Food', Icons.sentiment_neutral, 'assets/home-categories/category-2.png'),
  Category(
      'Wine', Icons.sentiment_neutral, 'assets/home-categories/category-3.png'),
  Category('Coffee', Icons.store_mall_directory,
      'assets/home-categories/category-4.png'),
  Category(
      'Meat', Icons.sentiment_neutral, 'assets/home-categories/category-5.png'),
  Category(
      'Beer', Icons.sentiment_neutral, 'assets/home-categories/category-6.png'),
];

List<Dishes> dishes = [
  Dishes(
      name: 'Boeuf bourguignon',
      details:
          'The dish hails from the same region as coq au vin – that’s Burgundy in eastern France – and there are similarities between the two dishes. Boeuf bourguignon is essentially a stew made from beef braised in red wine, beef broth.',
      image: 'assets/populars/Boeuf-bourguignon.jpg',
      price: 10000,
      rating: 4.5,
      preparation: '20 Minutos',
      comments: [
        Comments(
          name: 'Jessica Simons',
          comment:
              'It is a special place to visit in family. The neighborhood is nice',
          image: '',
        )
      ],
      category: [categories[0], categories[2]],
      promotion: true,
      pricePromotions: [10000, 20000, 30000]
      //
      ),
  Dishes(
      name: 'Chocolate soufflé',
      details:
          'The word soufflé comes from the French verb ‘to blow’ and, and the name suggests, this is a light, airy dessert. The dish dates back to the early 18th century and nowadays is a staple on dessert menus around the world.',
      image: 'assets/populars/Chocolate-souffle.jpg',
      price: 17000,
      rating: 4.8,
      preparation: '15 min',
      comments: [
        Comments(
          name: 'Jessica Simons',
          comment:
              'It is a special place to visit in family. The neighborhood is nice',
          image: '',
        )
      ],
      category: [categories[1], categories[3]],
      promotion: true,
      pricePromotions: []
      //
      ),
  Dishes(
      name: 'Salade Niçoise',
      details:
          'The word soufflé comes from the French verb ‘to blow’ and, and the name suggests, this is a light, airy dessert. The dish dates back to the early 18th century and nowadays is a staple on dessert menus around the world.',
      image: 'assets/populars/Salade-Niçoise.jpg',
      price: 17000,
      rating: 4.8,
      preparation: '40 min',
      comments: [
        Comments(
          name: 'Jessica Simons',
          comment:
              'It is a special place to visit in family. The neighborhood is nice',
          image: '',
        )
      ],
      category: [categories[0], categories[1], categories[2], categories[3]],
      promotion: true,
      pricePromotions: []
      //
      ),
];

List<Restaurants> restaurants = [
  Restaurants(
    name: 'First Resturant',
    description: 'a little description',
    image: '',
    rating: 4,
    type: Icons.access_alarm,
    location: [0.0, 0.0],
    distance: '4km',
    lunchNow: [], //List Dishes
    tagsMenu: ['tag1', 'tag2', 'tag3', 'tag4'],
    menu: [], //List Dishes
    suggestions: [],
    highlight: [],
    socialShare: ['Whatsapp', 'Pinterest', 'Instagram'],
    contact: [
      ContactMeans(value: 'Correo', key: 'contact@mail.com', type: 'email')
    ],
    comments: [
      Comments(
        name: 'Jessica Simons',
        comment:
            'It is a special place to visit in family. The neighborhood is nice',
        image: '',
      ),
      Comments(
        name: 'Jessica Simons',
        comment:
            'It is a special place to visit in family. The neighborhood is nice',
        image: '',
      )
    ],
    schedule: '8:00am to 9:00pm',
    categories: [categories[0], categories[1], categories[2], categories[3]],
    //
  ),
  Restaurants(
    name: 'Second Resturant',
    description: 'a little description',
    image: '',
    rating: 3,
    type: Icons.access_alarm,
    location: [0.0, 0.0],
    distance: '4km',
    lunchNow: [], //List Dishes
    tagsMenu: ['tag1', 'tag2', 'tag3', 'tag4'],
    menu: [], //List Dishes
    suggestions: [],
    highlight: [],
    socialShare: ['Whatsapp', 'Pinterest', 'Instagram'],
    contact: [
      ContactMeans(value: 'Correo', key: 'contact@mail.com', type: 'email'),
      ContactMeans(value: 'Whatsapp', key: '3102584895', type: 'whatsapp')
    ],
    comments: [
      Comments(
        name: 'Jessica Simons',
        comment:
            'It is a special place to visit in family. The neighborhood is nice',
        image: '',
      ),
    ],
    schedule: '8:00am to 9:00pm',
    categories: [categories[0], categories[3]],
    //
  ),
  Restaurants(
    name: 'Third Resturant',
    description: 'a little description',
    image: '',
    rating: 3,
    type: Icons.access_alarm,
    location: [0.0, 0.0],
    distance: '4km',
    lunchNow: [], //List Dishes
    tagsMenu: ['tag1', 'tag2', 'tag3', 'tag4'],
    menu: [], //List Dishes
    suggestions: [],
    highlight: [],
    socialShare: ['Whatsapp', 'Pinterest'],
    contact: [
      ContactMeans(value: 'Correo', key: 'contact@mail.com', type: 'email'),
      ContactMeans(value: 'Whatsapp', key: '3102584895', type: 'whatsapp')
    ],
    comments: [
      Comments(
        name: 'Jessica Simons',
        comment:
            'It is a special place to visit in family. The neighborhood is nice',
        image: '',
      ),
    ],
    schedule: '8:00am to 9:00pm',
    categories: [categories[0], categories[2]],
    //
  )
];
