import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    final _textStyle = TextStyle(color: Colors.white);
    if (user.containsKey('money'))
      return ListTile(
        title: Text(
          user['name'],
          style: _textStyle,
        ),
        subtitle: Text(
          user['email'],
          style: _textStyle,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "Pedidos: ${user['orders']}",
              style: _textStyle,
            ),
            Text(
              "Gastos: R\$${user['money'].toStringAsFixed(2)}",
              style: _textStyle,
            ),
          ],
        ),
      );
    else
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 20,
              child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white.withAlpha(50),
                    margin: EdgeInsets.symmetric(vertical: 4),
                  ),
                  baseColor: Colors.white,
                  highlightColor: Colors.grey),
            ),
            SizedBox(
              width: 200,
              height: 20,
              child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white.withAlpha(50),
                    margin: EdgeInsets.symmetric(vertical: 4),
                  ),
                  baseColor: Colors.white,
                  highlightColor: Colors.grey),
            )
          ],
        ),
      );
  }
}
