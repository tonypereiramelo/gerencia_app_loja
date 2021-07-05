import 'dart:async';

class LoginValidator {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Insira um e-mail valido');
    }
  });
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError('Senha inválida, deve conter no minimo 4 caracteres');
    }
  });
}
