import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../models/product.dart';


class ProductDetailScreen extends StatelessWidget {

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    int productId = ModalRoute.of(context)!.settings.arguments as int;

    Product loadedProduct = Provider.of<ProductsProvider>(context, listen: false).findById(productId);

    return Scaffold(appBar: AppBar(title: Text(loadedProduct.name),),);
  }

}
