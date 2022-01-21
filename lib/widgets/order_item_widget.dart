import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/order.dart';

class OrderItemWidget extends StatelessWidget {

  final Order order;

  OrderItemWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.all(10), child: Column(children: <Widget>[
      ListTile(
        title: Text('${order.totalPrice}'),
        subtitle: Text(DateFormat('dd/MM/yyyy HH:mm').format(order.dateTime)),
        trailing: IconButton(icon: Icon(Icons.expand_more), onPressed: () {  },),
      ),
    ],),);
  }

}
