import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {
  OrderHeader(this.order, {Key? key}) : super(key: key);
  final DocumentSnapshot<Map> order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Tony',
              ),
              Text(
                'Rua Paradaise',
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Produto: ${order.data()!['productPrice'].toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Preço Total: ${order.data()!['totalPrice'].toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        )
      ],
    );
  }
}
