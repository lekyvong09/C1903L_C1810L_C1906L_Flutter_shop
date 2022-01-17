import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartItemWidget extends StatelessWidget {

  final String productId;
  final int keyProductId;
  final String name;
  final int quantity;
  final double unitPrice;

  CartItemWidget(this.productId, this.keyProductId, this.unitPrice, this.quantity, this.name);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(productId),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) { Provider.of<Cart>(context, listen: false).removeItem(keyProductId); },
      background: Container(
        color: Theme.of(context).errorColor,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete_forever, color: Colors.white, size: 40,),
        // padding: EdgeInsets.only(right: 20),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(child: Padding(padding: EdgeInsets.all(1), child: FittedBox(child: Text('\$$unitPrice',),),),),
            title: Text(name),
            subtitle: Text('Total: \$${unitPrice * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }

}
