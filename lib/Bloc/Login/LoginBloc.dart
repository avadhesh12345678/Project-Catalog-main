import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'LoginValidator.dart';

class LoginBloc extends Object with LoginValidators {
  // Controllers
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();
  // ignore: close_sinks
  // final combineAll = StreamController<bool>.broadcast();

  // Adding Data To Stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitCheck =>
      Rx.combineLatest2(email, password, (e, p) => true);

  // combinedStreams() {
  //   // _combineAll.addStream(email);
  //   // _combineAll.addStream(password);

  //   StreamBuilder builder = StreamBuilder(
  //       stream: combineAll.stream,
  //       builder: (context, snapshot) {
  //         print(snapshot.hasError);
  //         return Container();
  //       });

  //   combineAll.stream.listen((event) {
  //     print(event);
  //   }, onError: (error) {
  //     print(error);
  //   });

  //   // _email.stream.listen((event) {
  //   //   print(event);
  //   // }, onError: (error) {
  //   //   print(error);
  //   // });

  //   // _password.stream.listen((event) {
  //   //   print(event);
  //   // }, onError: (error) {
  //   //   print(error);
  //   // });
  // }

  // Closures
  Function(String) get emailUpdate => _email.sink.add;
  Function(String) get passwordUpdate => _password.sink.add;

  // test() {
  //   // 1
  //   _email.stream.listen((event) {
  //     print(event);
  //   })
  //     ..onError((errror) {
  //       print(errror);
  //     });

  //   // 2
  //   _password.stream.listen((event) {
  //     print(event);
  //   })
  //     ..onError((errror) {
  //       print(errror);
  //     });
  // }

  // Dispose streams
  dispose() {
    _email.close();
    _password.close();
  }
}

final loginBloc = LoginBloc();
