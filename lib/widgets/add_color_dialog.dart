import 'package:flutter/material.dart';

class AddColorDialog extends StatelessWidget {
  AddColorDialog({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.only(right: 8, top: 8, left: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _controller,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(_controller.text);
                },
                child: Text(
                  'Add',
                ),
                style: TextButton.styleFrom(
                  primary: Colors.pinkAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
