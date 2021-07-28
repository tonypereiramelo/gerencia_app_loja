import 'package:flutter/material.dart';

class EditCategoryDialog extends StatelessWidget {
  const EditCategoryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(),
              ),
              title: TextField(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text('Excluir'),
                  style: TextButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
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
