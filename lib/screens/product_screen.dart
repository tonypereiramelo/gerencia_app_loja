import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/blocs/product_bloc.dart';
import 'package:gerencia_app_loja/validators/product_validator.dart';
import 'package:gerencia_app_loja/widgets/images_widget.dart';

class ProductScreen extends StatelessWidget with ProductValidator {
  ProductScreen({
    required this.categoryId,
    DocumentSnapshot<Map<String, dynamic>>? product,
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
      backgroundColor: Colors.grey[850],
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
        child: StreamBuilder<Map>(
            stream: _productBloc.outData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              return ListView(
                padding: EdgeInsets.all(16),
                children: <Widget>[
                  Text(
                    'Imagens',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  ImagesWidget(
                    context: context,
                    initialValue: snapshot.data!["images"],
                    onSaved: (l) {},
                    validator: validateImages,
                  ),
                  TextFormField(
                    initialValue: snapshot.data!['title'],
                    style: _fieldStyle,
                    decoration: _buildDecoration('Título'),
                    onSaved: (t) {},
                    validator: validatetitle,
                  ),
                  TextFormField(
                    initialValue: snapshot.data!['description'],
                    style: _fieldStyle,
                    maxLines: 6,
                    decoration: _buildDecoration('Descrição'),
                    onSaved: (t) {},
                    validator: validateDescription,
                  ),
                  TextFormField(
                    initialValue: snapshot.data!['price']?.toStringAsFixed(2),
                    style: _fieldStyle,
                    decoration: _buildDecoration('Preço'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSaved: (t) {},
                    validator: validatePrice,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
