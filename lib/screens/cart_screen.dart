import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/order.dart';
import '../models/cart.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  @override
  State<StatefulWidget> createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart'),),
      body: Column(children: <Widget>[
        Card(
          margin: EdgeInsets.all(15.0),
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 20),),
                Spacer(),
                Chip(label: Text('\$${cart.totalAmount.toStringAsFixed(2)}', style: TextStyle(color: Theme.of(context).primaryTextTheme.headline6!.color),), backgroundColor: Theme.of(context).primaryColor,),
                FlatButton(child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW', style: TextStyle(color: Theme.of(context).primaryColor),),
                    onPressed: (cart.totalAmount <=0 || _isLoading) ? null : () async {
                      setState(() { _isLoading = true; });
                      await Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                      setState(() { _isLoading = false; });
                    }
                ),
              ],
            ),
          ),
        ),
        // Expanded(child: ListView.builder(itemCount: cart.itemCount, itemBuilder: (ctx, idx) => CartItemWidget(cart.items[idx]!.id, cart.items[idx]!.unitPrice, cart.items[idx]!.quantity, cart.items[idx]!.name)),),
        Expanded(child: ListView.builder(itemCount: cart.itemCount, itemBuilder: (ctx, idx) => CartItemWidget(cart.items.values.toList()[idx].productId, cart.items.keys.toList()[idx], cart.items.values.toList()[idx].unitPrice, cart.items.values.toList()[idx].quantity, cart.items.values.toList()[idx].name)),),
      ],),
    );
  }

}
