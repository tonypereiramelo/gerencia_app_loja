import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/blocs/login_bloc.dart';
import 'package:gerencia_app_loja/widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginBloc = LoginBloc();
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
                    stream: _loginBloc.outEmail,
                    onChange: _loginBloc.changeEmail,
                  ),
                  InputField(
                    hint: 'Entre com sua senha',
                    labelHint: 'Senha',
                    obscure: true,
                    icon: Icons.lock,
                    stream: _loginBloc.outPassword,
                    onChange: _loginBloc.changePassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<bool>(
                      stream: _loginBloc.outSubmitValid,
                      builder: (context, snapshot) {
                        return ElevatedButton(
                          onPressed: snapshot.hasData ? () {} : null,
                          child: Text('Entrar'),
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: Colors.pinkAccent,
                            fixedSize: Size(
                              MediaQuery.of(context).size.width,
                              50,
                            ),
                            onSurface: Colors.pinkAccent,
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
