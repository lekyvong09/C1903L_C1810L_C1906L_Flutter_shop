import 'package:flutter/material.dart';
import '../models/product.dart';

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
  final _form = GlobalKey<FormState>();
  Product _editedProduct = Product(id: 0, name: '', description: '', unitPrice: 0, imageUrl: '');

  void initState() {
    _imageFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      setState(() { });
    }
  }

  void _saveForm() {
    _form.currentState!.save();
    print(_editedProduct.name);
    print(_editedProduct.description);
    print(_editedProduct.imageUrl);
    print(_editedProduct.unitPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product'), actions: <Widget>[IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(key: _form, child: SingleChildScrollView(child: Column(children: [
          TextFormField(decoration: InputDecoration(labelText: 'Title'), textInputAction: TextInputAction.next,
            onFieldSubmitted: (ctx) => FocusScope.of(context).requestFocus(_priceFocusNode),
            onSaved: (value) => _editedProduct = Product(name: value!, description: _editedProduct.description, unitPrice: _editedProduct.unitPrice, imageUrl: _editedProduct.imageUrl, id: 0),
          ),
          TextFormField(decoration: InputDecoration(labelText: 'Price'), focusNode: _priceFocusNode, textInputAction: TextInputAction.next, keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
            onFieldSubmitted: (ctx) => FocusScope.of(context).requestFocus(_descriptionFocusNode),
            onSaved: (value) => _editedProduct = Product(name: _editedProduct.name, description: _editedProduct.description, unitPrice: double.parse(value!), imageUrl: _editedProduct.imageUrl, id: 0),
          ),
          TextFormField(decoration: InputDecoration(labelText: 'Description'), focusNode: _descriptionFocusNode, maxLines: 3, textInputAction: TextInputAction.next, keyboardType: TextInputType.multiline,
            onFieldSubmitted: (ctx) => FocusScope.of(context).requestFocus(_imageFocusNode),
            onSaved: (value) => _editedProduct = Product(name: _editedProduct.name, description: value!, unitPrice: _editedProduct.unitPrice, imageUrl: _editedProduct.imageUrl, id: 0),
          ),
          Row(children: [
            Container(width: 100, height: 100, margin: EdgeInsets.only(top: 10, right: 10),
                child: _imageUrlController.text.isEmpty ? Text('Enter an URL') : FittedBox(child: Image.network(_imageUrlController.text), fit: BoxFit.cover,)
            ),
            Expanded(child: TextFormField(decoration: InputDecoration(labelText: 'Image URL'), focusNode: _imageFocusNode,
              controller: _imageUrlController, textInputAction: TextInputAction.done, keyboardType: TextInputType.url,
              onEditingComplete: () => setState(() { }),
              onSaved: (value) => _editedProduct = Product(name: _editedProduct.name, description: _editedProduct.description, unitPrice: _editedProduct.unitPrice, imageUrl: value!, id: 0),
            ),),
          ],), 
        ],),),),
      ),
    );
  }

}
