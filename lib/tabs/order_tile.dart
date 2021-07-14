import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({Key? key}) : super(key: key);

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
            '#123456 - Entregue',
            style: TextStyle(
              color: Colors.green,
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Camiseta Preta P',
                        ),
                        subtitle: Text(
                          'Camisetas/dfsjkdhfk',
                        ),
                        trailing: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ],
                  ),
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
