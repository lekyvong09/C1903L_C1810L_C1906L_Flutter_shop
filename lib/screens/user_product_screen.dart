import 'package:flutter/material.dart';
import 'package:my_second_app/widgets/user_product_item_widget.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class UserProductScreen extends StatelessWidget {

  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your products'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {},)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(itemCount: productsData.items.length, itemBuilder: (ctx, idx) => UserProductItemWidget(
            productsData.items[idx].name, productsData.items[idx].imageUrl)),
      ) ,
    );
  }

}
