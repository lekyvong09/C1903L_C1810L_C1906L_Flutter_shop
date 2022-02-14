import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  int id;
  String name;
  String description;
  double unitPrice;
  String imageUrl;
  bool isFavorite;

  Product({required this.id, required this.name, required this.description, required this.unitPrice,
    required this.imageUrl, this.isFavorite = false});

  Map toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'unitPrice': unitPrice,
    'imageUrl': imageUrl,
    'isFavorite': isFavorite,
  };

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
