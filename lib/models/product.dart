import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  bool isFavourite;
  final bool isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: ["assets/images/ps4_console_white_1.png", "assets/images/ps4_console_white_2.png", "assets/images/ps4_console_white_3.png", "assets/images/ps4_console_white_4.png"],
    colors: [const Color(0xFFF6625E), const Color(0xFF836DB8), const Color(0xFFDECB9C), Colors.white],
    title: "Wireless Controller for PS4™",
    price: 4999.00,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: ["assets/images/Image Popular Product 2.png"],
    colors: [const Color(0xFFF6625E), const Color(0xFF836DB8), const Color(0xFFDECB9C), Colors.white],
    title: "Nike Sport White - Pro Pant",
    price: 3495.00,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: ["assets/images/glap.png"],
    colors: [const Color(0xFFF6625E), const Color(0xFF836DB8), const Color(0xFFDECB9C), Colors.white],
    title: "Gloves XC Omega - Polygon",
    price: 1299.00,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: ["assets/images/wireless headset.png"],
    colors: [const Color(0xFFF6625E), const Color(0xFF836DB8), const Color(0xFFDECB9C), Colors.white],
    title: "Logitech Zone Wireless",
    price: 18490.00,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 5,
    images: ["assets/images/wireless headset.png"],
    colors: [Colors.black, Colors.blue, Colors.red],
    title: "Sony Studio Headphones",
    price: 29990.00,
    description: "Premium studio quality noise canceling wireless headphones.",
    rating: 4.9,
    isPopular: true,
  ),
  Product(
    id: 6,
    images: ["assets/images/Image Popular Product 2.png"],
    colors: [Colors.grey, Colors.black, Colors.white],
    title: "Adidas Running Joggers",
    price: 3999.00,
    description: "Lightweight and breathable pants for daily workouts.",
    rating: 4.5,
    isPopular: true,
  ),
  Product(
    id: 7,
    images: ["assets/images/glap.png"],
    colors: [Colors.red, Colors.green, Colors.black],
    title: "Mountain Bike Gloves Pro",
    price: 2499.00,
    description: "Durable and protective gloves for extreme mountain biking.",
    rating: 4.3,
  ),
  Product(
    id: 8,
    images: ["assets/images/ps4_console_white_1.png"],
    colors: [Colors.white, Colors.black],
    title: "Playstation 5 DualSense",
    price: 5990.00,
    description: "Next generation haptic feedback gaming controller.",
    rating: 4.9,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 9,
    images: ["assets/images/wireless headset.png"],
    colors: [Colors.blue, Colors.black],
    title: "Gaming Headset RGB",
    price: 7999.00,
    description: "7.1 Surround Sound gaming headset with LED lighting.",
    rating: 4.6,
  ),
  Product(
    id: 10,
    images: ["assets/images/Image Popular Product 2.png"],
    colors: [Colors.black, Colors.indigo],
    title: "Puma Track Pants",
    price: 2999.00,
    description: "Comfortable and stylish track pants for casual wear.",
    rating: 4.2,
    isFavourite: true,
  ),
  Product(
    id: 11,
    images: ["assets/images/glap.png"],
    colors: [Colors.black, Colors.orange],
    title: "Winter Snow Gloves",
    price: 1899.00,
    description: "Thick insulated gloves for extreme cold and snow sports.",
    rating: 4.7,
    isPopular: true,
  ),
  Product(
    id: 12,
    images: ["assets/images/ps4_console_white_1.png"],
    colors: [Colors.red, Colors.blue],
    title: "Custom Modded Controller",
    price: 15999.00,
    description: "Pro-level customized controller with back paddles.",
    rating: 4.4,
  ),
  Product(
    id: 13,
    images: ["assets/images/wireless headset.png"],
    colors: [Colors.white, const Color(0xFFDECB9C)],
    title: "AirPods Pro Gen 2",
    price: 24900.00,
    description: "Industry leading active noise canceling true wireless earbuds.",
    rating: 4.9,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 14,
    images: ["assets/images/Image Popular Product 2.png"],
    colors: [Colors.green, Colors.black],
    title: "Under Armour Shorts",
    price: 1999.00,
    description: "Quick-dry activewear shorts for the gym.",
    rating: 4.5,
  ),
  Product(
    id: 15,
    images: ["assets/images/glap.png"],
    colors: [Colors.blue, Colors.white],
    title: "Cycling Fingerless Gloves",
    price: 999.00,
    description: "Breathable padded gloves for road biking.",
    rating: 4.0,
  ),
  Product(
    id: 16,
    images: ["assets/images/ps4_console_white_1.png"],
    colors: [Colors.black],
    title: "Xbox Elite Controller Series 2",
    price: 15990.00,
    description: "The world's most advanced controller for Xbox and PC.",
    rating: 4.8,
    isPopular: true,
  ),
];


const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
