import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:http/http.dart' as httpClient;
import 'dart:convert';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    Product(id: 1, name: 'Red Shirt', description: 'A red shirt - it is pretty red!', unitPrice: 29.99, imageUrl: 'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',),
    Product(id: 2, name: 'Trousers', description: 'A nice pair of trousers.', unitPrice: 59.99, imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',),
    Product(id: 3, name: 'Yellow Scarf', description: 'Warm and cozy - exactly what you need for the winter.', unitPrice: 19.99, imageUrl: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',),
    Product(id: 4, name: 'A Pan', description: 'Prepare any meal you want.', unitPrice: 49.99, imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',),
  ];

  // getter
  List<Product> get items {
    return [..._items];
  }

  Product findById(int id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  // setter
  Future<void> addProduct(Product product) async {
    
    Uri url = Uri.parse('http://localhost:8080/api/product');

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final response = await httpClient.post(
          url, headers: headers, body: json.encode({
        'name': product.name,
        'description': product.description,
        'unitPrice': product.unitPrice,
        'imageUrl': product.imageUrl,
        'isFavorite': product.isFavorite,
        'unitsInStock': 100,
        'active': true,
        'category': {"id": 5, "categoryName": "MobileProduct"}
      }));

      print(json.decode(response.body));
      final res = json.decode(response.body);
      Product newProduct = Product(name: res['name'],
          description: res['description'],
          unitPrice: res['unitPrice'],
          imageUrl: res['imageUrl'],
          id: res['id']
      );
      _items.add(newProduct);
      print(json.encode(newProduct));
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }






  }

  void updateProduct(int id, Product newProduct) {
    int prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print("problem with updating product");
    }
  }

  void deleteProduct(int id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

}
