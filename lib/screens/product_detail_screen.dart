import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    int productId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(appBar: AppBar(title: Text(productId.toString()),),);
  }

}
