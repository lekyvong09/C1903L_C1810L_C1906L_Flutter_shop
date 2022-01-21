import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/navbar_drawer.dart';
import '../screens/cart_screen.dart';
import '../widgets/products_grid.dart';
import '../models/cart.dart';
import '../widgets/badge.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductsOverviewScreen();
}


class _ProductsOverviewScreen extends State<ProductsOverviewScreen> {

  bool _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (ctx) => [
              PopupMenuItem(child: Text('Only favorites'), value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All,),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(builder: (ctx, cartData, childWidget) => Badge(child: childWidget!, value: cartData.itemCount.toString(), color: Colors.deepOrangeAccent,),
            child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
                icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      drawer: NavbarDrawer(),
      body: ProductsGrid(_showFavoritesOnly),
    );
  }
}
