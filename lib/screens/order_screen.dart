import 'package:flutter/material.dart';
import 'package:my_second_app/widgets/order_item_widget.dart';
import 'package:provider/provider.dart';

import '../models/order.dart';

class OrderScreen extends StatelessWidget {

  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your orders'),),
      body: ListView.builder(
        itemBuilder: (ctx, idx) => OrderItemWidget(orderData.orders[idx]),
        itemCount: orderData.orders.length,
      ),
    );
  }

}
