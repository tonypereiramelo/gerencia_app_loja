import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/blocs/category_bloc.dart';
import 'package:gerencia_app_loja/widgets/image_source_sheet.dart';

class EditCategoryDialog extends StatelessWidget {
  EditCategoryDialog({DocumentSnapshot<Map<String, dynamic>>? category})
      : _categoryBloc = CategoryBloc(category),
        _controller = TextEditingController(
            text: category != null ? category.data()!['title'] : '');
  final CategoryBloc _categoryBloc;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        ImageSourceSheet(onImageSelected: (image) {
                      Navigator.of(context).pop();
                      _categoryBloc.setImage(image);
                    }),
                  );
                },
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
              title: StreamBuilder<String>(
                  stream: _categoryBloc.outTitle,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _controller,
                      onChanged: _categoryBloc.setTitle,
                      decoration: InputDecoration(
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                      ),
                    );
                  }),
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
                StreamBuilder<bool>(
                    stream: _categoryBloc.outSubmitValid,
                    builder: (context, snapshot) {
                      return TextButton(
                        onPressed: snapshot.hasData ? () {} : null,
                        child: Text('Salvar'),
                        style: TextButton.styleFrom(
                          primary: Colors.green,
                        ),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
