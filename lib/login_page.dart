import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.store_mall_directory,
                color: Colors.pinkAccent,
                size: 160,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.pinkAccent,
                  ),
                  hintText: 'Entre com seu usuário',
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: 'Usuário',
                  labelStyle: TextStyle(color: Colors.pinkAccent),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.password,
                    color: Colors.pinkAccent,
                  ),
                  hintText: 'Entre com sua senha',
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.pinkAccent),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
