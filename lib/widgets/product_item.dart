import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {

  final String imageUrl;
  final String name;
  final int id;

  ProductItem({required this.imageUrl, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return GridTile(child: Image.network(imageUrl),);
  }

}
