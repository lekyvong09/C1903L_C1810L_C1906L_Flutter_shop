import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

  // final String imageUrl;
  // final String name;
  // final int id;
  //
  // ProductItem({required this.imageUrl, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {

    Product product = Provider.of<Product>(context);

    return GestureDetector(
      // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProductDetailScreen(name))),
      onTap: () => Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.network(product.imageUrl, fit: BoxFit.cover,),
          footer: GridTileBar(
            title: Text(product.name, textAlign: TextAlign.center,),
            backgroundColor: Colors.black54,
            leading: IconButton(icon: Icon(Icons.favorite), color: Theme.of(context).accentColor, onPressed: () { },),
            trailing: IconButton(icon: Icon(Icons.shopping_cart), color: Theme.of(context).accentColor, onPressed: () { },),
          ),
        ),
      ),
    );
  }

}
