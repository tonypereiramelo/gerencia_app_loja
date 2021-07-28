import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/blocs/category_bloc.dart';

class EditCategoryDialog extends StatelessWidget {
  EditCategoryDialog({DocumentSnapshot<Map<String, dynamic>>? category})
      : _categoryBloc = CategoryBloc(category);
  final CategoryBloc _categoryBloc;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: GestureDetector(
                child: StreamBuilder<dynamic>(
                    stream: _categoryBloc.outImage,
                    builder: (context, snapshot) {
                      if (snapshot.data != null)
                        return CircleAvatar(
                          child: snapshot.data is File
                              ? Image.file(
                                  snapshot.data!,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  snapshot.data!,
                                  fit: BoxFit.cover,
                                ),
                          backgroundColor: Colors.transparent,
                        );
                      else
                        return Icon(Icons.image);
                    }),
              ),
              title: TextField(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StreamBuilder<bool>(
                    stream: _categoryBloc.outDelete,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return TextButton(
                        onPressed: snapshot.data! ? () {} : null,
                        child: Text('Excluir'),
                        style: TextButton.styleFrom(
                          primary: Colors.red,
                        ),
                      );
                    }),
                TextButton(
                  onPressed: () {},
                  child: Text('Salvar'),
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
