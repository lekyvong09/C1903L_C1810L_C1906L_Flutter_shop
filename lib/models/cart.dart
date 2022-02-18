import 'package:flutter/material.dart';

class CartItem {
  int productId;
  String name;
  int quantity;
  double unitPrice;
  String imageUrl;

  CartItem({required this.productId, required this.name, required this.quantity, required this.unitPrice,
    required this.imageUrl});
  Map toJson() => {
    'productId': productId,
    'name': name,
    'quantity': quantity,
    'unitPrice': unitPrice,
    'imageUrl': imageUrl,
  };
}


class Cart with ChangeNotifier {
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
    return {..._items};
  }

  void addItem(int productId, double unitPrice, String name, String imageUrl) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingCartItem) => CartItem(productId: existingCartItem.productId,
          name: existingCartItem.name, quantity: existingCartItem.quantity + 1, unitPrice: existingCartItem.unitPrice, imageUrl: existingCartItem.imageUrl));
    } else {
      _items.putIfAbsent(productId, () => CartItem(productId: productId, name: name, quantity: 1, unitPrice: unitPrice, imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void removeItem(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(int productId) {
    if (!_items.containsKey(productId)) {
      return;
    }

    if (_items[productId]!.quantity > 1) {
      _items.update(productId, (existingCartItem) => CartItem(productId: existingCartItem.productId, name: existingCartItem.name, unitPrice: existingCartItem.unitPrice, quantity: existingCartItem.quantity -1,
          imageUrl: existingCartItem.imageUrl));
    } else {
      _items.remove(productId);
    }
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
