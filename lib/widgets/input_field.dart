import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? hint;
  final String? labelHint;
  final bool? obscure;
  final IconData? icon;
  final Stream<String>? stream;
  final Function(String)? onChange;

  const InputField({
    Key? key,
    required this.hint,
    required this.labelHint,
    required this.obscure,
    required this.icon,
    required this.stream,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: stream,
        builder: (context, snapshot) {
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
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
              errorStyle: TextStyle(
                color: Colors.red,
              ),
            ),
            obscureText: obscure!,
          );
        });
  }
}
