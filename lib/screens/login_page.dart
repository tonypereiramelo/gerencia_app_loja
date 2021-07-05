import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/widgets/input_field.dart';

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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          SingleChildScrollView(
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
                  InputField(
                    hint: 'Entre com seu Usuário',
                    icon: Icons.person,
                    labelHint: 'Usuário',
                    obscure: false,
                  ),
                  InputField(
                    hint: 'Entre com sua senha',
                    labelHint: 'Senha',
                    obscure: true,
                    icon: Icons.lock,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Entrar'),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.pinkAccent,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
