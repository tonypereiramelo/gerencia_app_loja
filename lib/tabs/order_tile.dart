import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/widgets/order_header.dart';

class OrderTile extends StatelessWidget {
  OrderTile(this.order, {Key? key}) : super(key: key);
  final DocumentSnapshot<Map> order;
  final states = [
    '',
    'Em Preparação',
    'Em Transporte',
    'Aguardando Entrega',
    'Entregue',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Card(
        child: ExpansionTile(
          title: Text(
            '#${order.id} - ${states[order.data()!['status']]}',
            style: TextStyle(
              color: order.data()!['status'] != 4
                  ? Colors.grey[850]
                  : Colors.green,
            ),
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 0,
                bottom: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  OrderHeader(),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: order.data()!['products'].map<Widget>((p) {
                        return ListTile(
                          title: Text(
                            p['product']['title'],
                          ),
                          subtitle: Text(
                            p['category'] + '/' + p['pid'],
                          ),
                          trailing: Text(
                            p['quantity'].toString(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                        );
                      }).toList()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Excluir',
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Regredir',
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.grey[850],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Avançar',
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
