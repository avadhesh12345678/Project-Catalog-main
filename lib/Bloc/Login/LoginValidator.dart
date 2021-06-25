import 'dart:async';

class LoginValidators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    return email.contains('@') && email.contains('.')
        ? sink.add(email)
        : sink.addError('Enter a valid email');
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    return password.length > 3
        ? sink.add(password)
        : sink.addError('Password must be at least 4 characters');
  });
}
