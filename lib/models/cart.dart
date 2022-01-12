import 'package:flutter/material.dart';

class CartItem {
  String id;
  String name;
  int quantity;
  double unitPrice;

  CartItem({required this.id, required this.name, required this.quantity, required this.unitPrice});
}


class Cart with ChangeNotifier {
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
    return {..._items};
  }

  void addItem(int productId, double unitPrice, String name,) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingCartItem) => CartItem(id: existingCartItem.id,
          name: existingCartItem.name, quantity: existingCartItem.quantity + 1, unitPrice: existingCartItem.unitPrice));
    } else {
      _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), name: name, quantity: 1, unitPrice: unitPrice));
    }
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

}
