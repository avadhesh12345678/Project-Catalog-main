import 'dart:async';
import 'package:Project_Catalog/NetworkUtil/APIHandler.dart';

class BlocController {
  // Stream Controller
  final controller = StreamController<Welcome>();

  // Stream Getter Object
  Stream get getStream => controller.stream;

  testBloc() {
    var signInModel = controller.sink.add(Welcome());
  }
}
