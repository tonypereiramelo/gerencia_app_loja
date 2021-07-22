import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/blocs/product_bloc.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({
    required this.categoryId,
    DocumentSnapshot<Map>? product,
  })  : product = product,
        _productBloc = ProductBloc(categoryId: categoryId, product: product);

  final String categoryId;
  final DocumentSnapshot<Map>? product;
  final ProductBloc _productBloc;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    InputDecoration _buildDecoration(String label) {
      return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
      );
    }

    final _fieldStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Criar Produto'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              style: _fieldStyle,
              decoration: _buildDecoration('Título'),
              onSaved: (t) {},
              validator: (t) {},
            ),
            TextFormField(
              style: _fieldStyle,
              maxLines: 6,
              decoration: _buildDecoration('Descrição'),
              onSaved: (t) {},
              validator: (t) {},
            ),
            TextFormField(
              style: _fieldStyle,
              decoration: _buildDecoration('Preço'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSaved: (t) {},
              validator: (t) {},
            ),
          ],
        ),
      ),
    );
  }
}
