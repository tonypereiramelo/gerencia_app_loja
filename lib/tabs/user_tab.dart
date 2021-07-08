import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/blocs/user_bloc.dart';
import 'package:gerencia_app_loja/widgets/user_tile.dart';

class UserTab extends StatelessWidget {
  const UserTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white);
    final _userBloc = BlocProvider.getBloc<UserBloc>();
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
            onChanged: _userBloc.onChangedSearch,
          ),
        ),
        Expanded(
          child: StreamBuilder<List>(
              stream: _userBloc.outUsers,
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
                    ),
                  );
                else if (snapshot.data!.length == 0)
                  return Center(
                    child: Text(
                      'Nenhum usuário encontrado!',
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                  );
                else
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return UserTile(
                        user: snapshot.data![index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.white,
                      );
                    },
                    itemCount: snapshot.data!.length,
                  );
              }),
        ),
      ],
    );
  }
}
