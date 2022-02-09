import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/navbar_drawer.dart';
import '../widgets/user_product_item_widget.dart';
import '../providers/products_provider.dart';
import '../screens/product_edit_screen.dart';

class UserProductScreen extends StatelessWidget {

  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your products'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => Navigator.of(context).pushNamed(ProductEditScreen.routeName),)
        ],
      ),
      drawer: NavbarDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(itemCount: productsData.items.length, itemBuilder: (ctx, idx) => Column(children: [
          UserProductItemWidget(productsData.items[idx].id, productsData.items[idx].name, productsData.items[idx].imageUrl),
          Divider(),
        ],),),
      ),
    );
  }

}
