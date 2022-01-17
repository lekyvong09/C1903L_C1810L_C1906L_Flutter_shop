import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {

  final String id;
  final String name;
  final int quantity;
  final double unitPrice;

  CartItemWidget(this.id, this.unitPrice, this.quantity, this.name);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(child: Padding(padding: EdgeInsets.all(2), child: FittedBox(child: Text('\$$unitPrice',),),),),
          title: Text(name),
          subtitle: Text('Total: \$${unitPrice * quantity}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }

}
