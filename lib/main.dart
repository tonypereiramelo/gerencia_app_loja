import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento Loja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: LoginPage(),
    );
  }
}
