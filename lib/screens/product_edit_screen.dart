import 'package:flutter/material.dart';

class ProductEditScreen extends StatefulWidget {
  static const routeName = 'product-edit';

  @override
  State<StatefulWidget> createState() => _ProductEditScreen();
}

class _ProductEditScreen extends State<ProductEditScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();

  void initState() {
    _imageFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      setState(() { });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product'),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(child: SingleChildScrollView(child: Column(children: [
          TextFormField(decoration: InputDecoration(labelText: 'Title'), textInputAction: TextInputAction.next,
            onFieldSubmitted: (ctx) => FocusScope.of(context).requestFocus(_priceFocusNode),),
          TextFormField(decoration: InputDecoration(labelText: 'Price'), focusNode: _priceFocusNode, textInputAction: TextInputAction.next, keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
            onFieldSubmitted: (ctx) => FocusScope.of(context).requestFocus(_descriptionFocusNode),),
          TextFormField(decoration: InputDecoration(labelText: 'Description'), focusNode: _descriptionFocusNode, maxLines: 3, textInputAction: TextInputAction.next, keyboardType: TextInputType.multiline,
            onFieldSubmitted: (ctx) => FocusScope.of(context).requestFocus(_imageFocusNode),),
          Row(children: [
            Container(width: 100, height: 100, margin: EdgeInsets.only(top: 10, right: 10),
                child: _imageUrlController.text.isEmpty ? Text('Enter an URL') : FittedBox(child: Image.network(_imageUrlController.text), fit: BoxFit.cover,)
            ),
            Expanded(child: TextFormField(decoration: InputDecoration(labelText: 'Image URL'), focusNode: _imageFocusNode,
              controller: _imageUrlController, textInputAction: TextInputAction.done, keyboardType: TextInputType.url,
              onEditingComplete: () => setState(() { }),
            ),),
          ],), 
        ],),),),
      ),
    );
  }

}
