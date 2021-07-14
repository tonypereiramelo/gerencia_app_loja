import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {
  const OrderHeader({Key? key}) : super(key: key);

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
              'Preço do produto',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Preço total',
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
