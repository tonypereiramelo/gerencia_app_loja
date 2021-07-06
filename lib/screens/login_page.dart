import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/blocs/login_bloc.dart';
import 'package:gerencia_app_loja/screens/home_screen.dart';
import 'package:gerencia_app_loja/widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    _loginBloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCESS:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
          break;
        case LoginState.FAIL:
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Erro'),
                    content: Text('Voçê não possui privilégios necessários'),
                  ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: StreamBuilder<LoginState>(
          stream: _loginBloc.outState,
          initialData: LoginState.LOADING,
          builder: (context, snapshot) {
            switch (snapshot.data!) {
              case LoginState.LOADING:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
                  ),
                );
              case LoginState.FAIL:
              case LoginState.SUCESS:
              case LoginState.IDLE:
                return Stack(
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
                                    onPressed: snapshot.hasData
                                        ? _loginBloc.subimit
                                        : null,
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
                );
            }
          }),
    );
  }
}
