import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Example',
      home: StreamExample(),
    );
  }
}

class StreamExampleState extends State {
  void onPauseHandler() {
    print('on Pause');
  }

  StreamController streamController;

  @override
  void initState() {
    super.initState();

    streamController = new StreamController(
      onPause: onPauseHandler,
    );

    // ignore: cancel_subscriptions
    StreamSubscription subscription;
    subscription = streamController.stream.listen((data) {
      print("DataReceived: " + data);

      // Add 5 seconds delay
      // It will call onPause function passed on StreamController constructor
      // subscription.pause(Future.delayed(const Duration(seconds: 5)));
    }, onDone: () {
      print("Task Done");
    }, onError: (error) {
      print("Some Error");
    });

    streamController.add("This a test data");
    streamController.addError('An Text Exception');
    streamController.add("This a test data 2");
    // streamController.close(); //Streams must be closed when not needed
    streamController.add("This a test data 3");
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Example'),
      ),
      body: Center(child: Text("Woolha.com")),
    );
  }
}

class StreamExample extends StatefulWidget {
  @override
  StreamExampleState createState() => new StreamExampleState();
}
