import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;
import 'dart:convert';

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

  Future<void> toggleFavoriteStatus() {
    Uri url = Uri.parse('http://localhost:8080/api/products/$id');
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    
    return httpClient.put(url, headers: headers, body: json.encode({
      'name': this.name,
      'description': this.description,
      'unitPrice': this.unitPrice,
      'imageUrl': this.imageUrl,
      'favorite': !this.isFavorite,
      'unitsInStock': 100,
      'active': true,
      'category': {"id": 5, "categoryName": "MobileProduct"}
    })).then((response) {
      if (response.statusCode == 200) {
        isFavorite = !isFavorite;
        notifyListeners();
      } else {
        try {
          print(json.decode(response.body));  
        } on FormatException catch (e) {
          print('Message return is not a valid JSON format');
        }
      }
    }).catchError((error) => throw error);
  }
}
