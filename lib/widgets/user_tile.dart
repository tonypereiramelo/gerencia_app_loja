import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textStyle = TextStyle(color: Colors.white);
    return ListTile(
      title: Text(
        'title',
        style: _textStyle,
      ),
      subtitle: Text(
        'subtitle',
        style: _textStyle,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "Pedidos: 0",
            style: _textStyle,
          ),
          Text(
            "Gastos: 0",
            style: _textStyle,
          ),
        ],
      ),
    );
  }
}
