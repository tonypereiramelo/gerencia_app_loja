import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/blocs/orders_bloc.dart';
import 'package:gerencia_app_loja/tabs/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ordersBloc = BlocProvider.getBloc<OrdersBloc>();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: StreamBuilder<Object>(
          stream: _ordersBloc.outOrders,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
                ),
              );
            /* else if (snapshot.data!.length == 0)
              return Center(
                child: Text(
                  'Nenhum pedido encontrado!',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ); */
            else
              print(snapshot);
            return ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return OrderTile();
                });
          }),
    );
  }
}
