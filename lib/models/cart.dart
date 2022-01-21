import 'package:flutter/material.dart';

class CartItem {
  int productId;
  String name;
  int quantity;
  double unitPrice;

  CartItem({required this.productId, required this.name, required this.quantity, required this.unitPrice});
  Map toJson() => {
    'productId': productId,
    'name': name,
    'quantity': quantity,
    'unitPrice': unitPrice
  };
}


class Cart with ChangeNotifier {
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
    return {..._items};
  }

  void addItem(int productId, double unitPrice, String name,) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingCartItem) => CartItem(productId: existingCartItem.productId,
          name: existingCartItem.name, quantity: existingCartItem.quantity + 1, unitPrice: existingCartItem.unitPrice));
    } else {
      _items.putIfAbsent(productId, () => CartItem(productId: productId, name: name, quantity: 1, unitPrice: unitPrice));
    }
    notifyListeners();
  }

  void removeItem(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) => total += cartItem.unitPrice*cartItem.quantity);
    return total;
  }

}
