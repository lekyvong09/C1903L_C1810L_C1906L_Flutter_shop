import 'package:flutter/material.dart';

class ProductEditScreen extends StatefulWidget {
  static const routeName = 'product-edit';

  @override
  State<StatefulWidget> createState() => _ProductEditScreen();
}

class _ProductEditScreen extends State<ProductEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product'),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: TextFormField(
          decoration: InputDecoration(labelText: 'Title'),
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }

}
