import 'package:flutter/material.dart';
import './models/cart.dart';
import './screens/cart_screen.dart';
import 'package:provider/provider.dart';

import './providers/products_provider.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './models/order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => ProductsProvider(),),
        ChangeNotifierProvider(create: (BuildContext context) => Cart(),),
        ChangeNotifierProvider(create: (BuildContext context) => Orders(),),
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}

