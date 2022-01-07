import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {

  final String imageUrl;
  final String name;
  final int id;

  ProductItem({required this.imageUrl, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(imageUrl, fit: BoxFit.cover,),
        footer: GridTileBar(
          title: Text(name, textAlign: TextAlign.center,),
          backgroundColor: Colors.black54,
          leading: IconButton(icon: Icon(Icons.favorite), color: Theme.of(context).accentColor, onPressed: () { },),
          trailing: IconButton(icon: Icon(Icons.shopping_cart), color: Theme.of(context).accentColor, onPressed: () { },),
        ),
      ),
    );
  }

}
