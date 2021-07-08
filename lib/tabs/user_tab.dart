import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/widgets/user_tile.dart';

class UserTab extends StatelessWidget {
  const UserTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            style: textStyle,
            decoration: InputDecoration(
              hintText: 'Pesquisar',
              hintStyle: textStyle,
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return UserTile();
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.white,
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
