import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List<List<dynamic>> _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Biriyani", "180.0", "lib/images/B.png", Colors.orange],
    ["Chicken Noodles", "160.0", "lib/images/CN.png", Colors.yellow],
    ["Cake", "120.0", "lib/images/C.png", Colors.brown],
    ["Milkshake", "100.0", "lib/images/MS.png", Colors.pink],
  ];

  // list of cart items
  final List<List<dynamic>> _cartItems = [];

  // Getter for cart items
  List<List<dynamic>> get cartItems => _cartItems;

  // Getter for shop items
  List<List<dynamic>> get shopItems => _shopItems;

  // Add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // Calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  void clearCart() {}
}
