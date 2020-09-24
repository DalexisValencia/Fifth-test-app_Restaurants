import 'package:fith_app__restaurant/interfaces/Comments.dart';
import 'package:fith_app__restaurant/interfaces/ContactMeans.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Ingredients.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
import 'package:fith_app__restaurant/interfaces/categories.dart';
import 'package:flutter/material.dart';

List<Category> categories = [
  Category(
      name: 'Break Fast',
      icon: Icons.store_mall_directory,
      iconSource: 'assets/home-categories/category-1.png'),
  Category(
      name: 'Food',
      icon: Icons.sentiment_neutral,
      iconSource: 'assets/home-categories/category-2.png'),
  Category(
      name: 'Wine',
      icon: Icons.sentiment_neutral,
      iconSource: 'assets/home-categories/category-3.png'),
  Category(
      name: 'Coffee',
      icon: Icons.store_mall_directory,
      iconSource: 'assets/home-categories/category-4.png'),
  Category(
      name: 'Meat',
      icon: Icons.sentiment_neutral,
      iconSource: 'assets/home-categories/category-5.png'),
  Category(
      name: 'Beer',
      icon: Icons.sentiment_neutral,
      iconSource: 'assets/home-categories/category-6.png'),
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
        ),
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
      category: [categories[0].name, categories[2].name],
      promotion: true,
      pricePromotions: [10000, 20000, 30000],
      additions: [
        Adittional(title: 'Cubiertos', isMulti: false, children: [
          AditionalsOptions(name: 'Con Cubiertos', isActive: false, price: 0),
        ]),
        Adittional(title: 'Bebida Personal', isMulti: false, children: [
          AditionalsOptions(name: 'Coca Cola', isActive: false, price: 3000),
          AditionalsOptions(name: 'Pepsi', isActive: false, price: 3000),
          AditionalsOptions(
              name: 'Jugo de Naranja', isActive: false, price: 4000),
          AditionalsOptions(
              name: 'Jugo de Guanabana', isActive: false, price: 4000),
          AditionalsOptions(
              name: 'Jugo de Mango', isActive: false, price: 4000),
          AditionalsOptions(name: 'Limonada', isActive: false, price: 4000),
        ])
      ],
      ingredients: [
        Ingredients(name: 'Beef', amountGrams: '40G'),
        Ingredients(name: 'Onion', amountGrams: '50G'),
        Ingredients(name: 'Garlic', amountGrams: '50G'),
        Ingredients(name: 'Carrot', amountGrams: '8G'),
        Ingredients(name: 'Flour', amountGrams: '15G'),
        Ingredients(name: 'Salt', amountGrams: '5G'),
        Ingredients(name: 'Parsley', amountGrams: '0.2G'),
        Ingredients(name: 'Tomato Paste', amountGrams: '2G'),
        Ingredients(name: 'Red Wine', amountGrams: '0.5ml'),
      ]
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
        ),
        Comments(
          name: 'Jessica Simons',
          comment:
              'It is a special place to visit in family. The neighborhood is nice',
          image: '',
        )
      ],
      category: [categories[1].name, categories[3].name],
      promotion: true,
      pricePromotions: [],
      additions: [],
      ingredients: [
        Ingredients(name: 'Beef', amountGrams: '40G'),
        Ingredients(name: 'Potatoe', amountGrams: '50G'),
        Ingredients(name: 'Carrot', amountGrams: '30G'),
      ]
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
      category: [
        categories[0].name,
        categories[1].name,
        categories[2].name,
        categories[3].name
      ],
      promotion: true,
      pricePromotions: [],
      additions: [],
      ingredients: [
        Ingredients(name: 'Beef', amountGrams: '40G'),
        Ingredients(name: 'Potatoe', amountGrams: '50G'),
        Ingredients(name: 'Carrot', amountGrams: '30G'),
      ]
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
    menu: dishes, //List Dishes
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
    categories: [
      categories[0].name,
      categories[1].name,
      categories[2].name,
      categories[3].name
    ],
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
    menu: dishes, //List Dishes
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
    categories: [categories[0].name, categories[3].name],
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
    categories: [categories[0].name, categories[2].name],
    //
  )
];
