import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/blocs/user_bloc.dart';

class OrderHeader extends StatelessWidget {
  OrderHeader(this.order, {Key? key}) : super(key: key);
  final DocumentSnapshot<Map> order;

  @override
  Widget build(BuildContext context) {
    final _userBloc = BlocProvider.getBloc<UserBloc>();
    final _user = _userBloc.getUser(order.data()!['clientId']);
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${_user!['name']}',
              ),
              Text(
                '${_user['address']}',
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
