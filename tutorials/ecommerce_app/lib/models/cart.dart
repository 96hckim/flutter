import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final List<Shoe> _shoeShop = [
    Shoe(
      name: 'Adidas Terrex',
      price: '150',
      imagePath: 'lib/images/ADIDAS-TERREX.jpg',
      description: 'Elevate your style while running',
    ),
    Shoe(
      name: 'Air Jordan',
      price: '240',
      imagePath: 'lib/images/AIR-JORDAN.jpg',
      description: 'Feel like a pro',
    ),
    Shoe(
      name: 'Nike Air Max',
      price: '200',
      imagePath: 'lib/images/NIKE-AIR-MAX.jpg',
      description: 'The shoe for all occasions',
    ),
    Shoe(
      name: 'Nike Waffle',
      price: '68',
      imagePath: 'lib/images/NIKE-WAFFLE.jpg',
      description: 'Take it easy with this shoe',
    ),
  ];

  final List<Shoe> _cartItems = [];

  List<Shoe> getShoeShop() => _shoeShop;

  List<Shoe> getCart() => _cartItems;

  void addToCart(Shoe shoe) {
    _cartItems.add(shoe);
    notifyListeners();
  }

  void removeFromCart(Shoe shoe) {
    _cartItems.remove(shoe);
    notifyListeners();
  }
}
