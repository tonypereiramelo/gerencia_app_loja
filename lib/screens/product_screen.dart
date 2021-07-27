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
        title: StreamBuilder<bool>(
            stream: _productBloc.outCreated,
            initialData: false,
            builder: (context, snapshot) {
              return Text(snapshot.data! ? 'Editar Produto' : 'Criar Produto');
            }),
        actions: <Widget>[
          StreamBuilder<bool>(
              stream: _productBloc.outCreated,
              initialData: false,
              builder: (context, snapshot) {
                if (snapshot.data!)
                  return StreamBuilder<bool>(
                      stream: _productBloc.outLoading,
                      initialData: false,
                      builder: (context, snapshot) {
                        return IconButton(
                          onPressed: snapshot.data!
                              ? null
                              : () {
                                  _productBloc.deleteProduct();
                                  Navigator.of(context).pop();
                                },
                          icon: Icon(
                            Icons.remove,
                          ),
                        );
                      });
                else
                  return Container();
              }),
          StreamBuilder<bool>(
              stream: _productBloc.outLoading,
              initialData: false,
              builder: (context, snapshot) {
                return IconButton(
                  onPressed: snapshot.data!
                      ? null
                      : () {
                          saveProduct(context);
                        },
                  icon: Icon(
                    Icons.save,
                  ),
                );
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Form(
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
                        onSaved: _productBloc.saveImages,
                        validator: validateImages,
                      ),
                      TextFormField(
                        initialValue: snapshot.data!['title'],
                        style: _fieldStyle,
                        decoration: _buildDecoration('Título'),
                        onSaved: _productBloc.saveTitle,
                        validator: validatetitle,
                      ),
                      TextFormField(
                        initialValue: snapshot.data!['description'],
                        style: _fieldStyle,
                        maxLines: 6,
                        decoration: _buildDecoration('Descrição'),
                        onSaved: _productBloc.saveDescription,
                        validator: validateDescription,
                      ),
                      TextFormField(
                        initialValue:
                            snapshot.data!['price']?.toStringAsFixed(2),
                        style: _fieldStyle,
                        decoration: _buildDecoration('Preço'),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onSaved: _productBloc.savePrice,
                        validator: validatePrice,
                      ),
                    ],
                  );
                }),
          ),
          StreamBuilder<bool>(
              stream: _productBloc.outLoading,
              initialData: false,
              builder: (context, snapshot) {
                return IgnorePointer(
                  ignoring: !snapshot.data!,
                  child: Container(
                    color: snapshot.data! ? Colors.black54 : Colors.transparent,
                  ),
                );
              }),
        ],
      ),
    );
  }

  void saveProduct(BuildContext? context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text(
            'Salvando Produto...',
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(minutes: 1),
          backgroundColor: Colors.pinkAccent,
        ),
      );
      bool succes = await _productBloc.saveProduct();
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            succes ? 'Produto salvo!' : 'Erro ao salvar produto!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pinkAccent,
        ),
      );
    }
  }
}
