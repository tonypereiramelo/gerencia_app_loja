import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/screens/product_screen.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({required this.category, Key? key}) : super(key: key);

  final DocumentSnapshot<Map<String, dynamic>> category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Card(
        child: ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(category.data()!['icon']),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            category.data()!['title'],
            style:
                TextStyle(color: Colors.grey[850], fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            FutureBuilder<QuerySnapshot<Map>>(
                future: category.reference.collection("items").get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return Column(
                    children: snapshot.data!.docs.map((doc) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(doc.data()['images'][0]),
                        ),
                        title: Text(doc.data()['title']),
                        trailing: Text(
                            'R\$${doc.data()['price'].toStringAsFixed(2)}'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                categoryId: category.id,
                                product: doc,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList()
                      ..add(
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.add,
                              color: Colors.pinkAccent,
                            ),
                          ),
                          title: Text('Adicionar'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                  categoryId: category.id,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
