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
    preparation: '20 Min',
    comments: [
      Comments(
        name: 'Mark Pepers',
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
        name: 'Simon Brand',
        comment:
            'It is a special place to visit in family. The neighborhood is nice',
        image: '',
      )
    ],
    category: [categories[0].name, categories[2].name],
    additions: [
      Adittional(title: 'Cookware', isMulti: false, children: [
        AditionalsOptions(name: 'With Cookware', isActive: true, price: 0),
      ]),
      Adittional(title: 'Personal drink', isMulti: false, children: [
        AditionalsOptions(name: 'Coca Cola', isActive: false, price: 3000),
        AditionalsOptions(name: 'Pepsi', isActive: false, price: 3000),
        AditionalsOptions(name: 'Orange Juice', isActive: false, price: 4000),
        AditionalsOptions(name: 'Soursop Juice', isActive: false, price: 4000),
        AditionalsOptions(name: 'Mango Juice', isActive: false, price: 4000),
        AditionalsOptions(name: 'Limonade', isActive: false, price: 4000),
      ]),
      Adittional(title: 'Sauces', isMulti: true, children: [
        AditionalsOptions(name: 'Beef', isActive: false, price: 500),
        AditionalsOptions(name: 'Tomato', isActive: false, price: 0),
        AditionalsOptions(name: 'Steak', isActive: false, price: 0),
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
      Ingredients(name: 'Red Wine', amountGrams: '0.5Ml'),
    ],
    amount: 1,
    promotionLabel: Promotions(
      active: true,
      color: Color(0xFFE76D6F),
      label: 'Ready In Seconds',
      pricePromotions: [
        PricePromotions(amount: 2, price: 18000),
        PricePromotions(amount: 4, price: 35000),
        PricePromotions(amount: 8, price: 68000),
      ],
      discounts: 0,
    ),
    finalPrice: 10000,
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
          name: 'Michael White',
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
      additions: [],
      ingredients: [
        Ingredients(name: 'Beef', amountGrams: '40G'),
        Ingredients(name: 'Potatoe', amountGrams: '50G'),
        Ingredients(name: 'Carrot', amountGrams: '30G'),
      ],
      amount: 1,
      promotionLabel: Promotions(
        active: false,
        color: Color(0xFF4F57D5),
        label: 'Special For You',
        pricePromotions: [],
        discounts: 0,
      ),
      finalPrice: 17000
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
      additions: [],
      ingredients: [
        Ingredients(name: 'Beef', amountGrams: '40G'),
        Ingredients(name: 'Potatoe', amountGrams: '50G'),
        Ingredients(name: 'Carrot', amountGrams: '30G'),
      ],
      amount: 1,
      promotionLabel: Promotions(
        active: false,
        color: Color(0xFFFFB60E),
        label: 'Best Promotion',
        pricePromotions: [],
        discounts: 0,
      ),
      finalPrice: 17000
      //
      ),
];

List<Restaurants> restaurants = [
  Restaurants(
    name: 'First Resturant',
    description: 'a little description',
    image: 'assets/banner/french-food.png',
    rating: 4,
    type: Icons.access_alarm,
    location: [0.0, 0.0],
    distance: '4km',
    lunchNow: dishes, //List Dishes
    tagsMenu: [
      'champignons (100)',
      'Beef Roast (10)',
      'Pieces of Meat (5)',
      'Chicken (67)'
    ],
    menu: dishes, //List Dishes
    suggestions: dishes,
    highlight: [],
    socialShare: ['Whatsapp', 'Pinterest', 'Instagram'],
    contact: [
      ContactMeans(value: 'Correo', key: 'contact@mail.com', type: 'email'),
      ContactMeans(value: 'Whatsapp', key: '3015023400', type: 'whatsapp'),
      ContactMeans(value: 'Teléfono', key: '3015023400', type: 'call')
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
    image: 'assets/banner/mexican-food.png',
    rating: 3,
    type: Icons.access_alarm,
    location: [0.0, 0.0],
    distance: '4km',
    lunchNow: dishes, //List Dishes
    tagsMenu: ['Pork Chops (15)', 'Ham (5)', 'Potatoes (10)', 'Sauces (39)'],
    menu: dishes, //List Dishes
    suggestions: dishes,
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
    image: 'assets/banner/fast-food.png',
    rating: 3,
    type: Icons.access_alarm,
    location: [0.0, 0.0],
    distance: '4km',
    lunchNow: dishes, //List Dishes
    tagsMenu: [
      'champignons (100)',
      'Wine (20)',
      'Grilled Fish(4)',
      'Roast Fish (6)'
    ],
    menu: [], //List Dishes
    suggestions: dishes,
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
