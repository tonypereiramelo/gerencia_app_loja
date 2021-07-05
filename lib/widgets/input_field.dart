import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? hint;
  final String? labelHint;
  final bool? obscure;
  final IconData? icon;

  const InputField(
      {Key? key,
      required this.hint,
      required this.labelHint,
      required this.obscure,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: Colors.pinkAccent,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white),
        labelText: labelHint,
        labelStyle: TextStyle(color: Colors.pinkAccent),
        contentPadding: EdgeInsets.only(
          left: 5,
          right: 30,
          bottom: 30,
          top: 30,
        ),
      ),
      obscureText: obscure!,
    );
  }
}
