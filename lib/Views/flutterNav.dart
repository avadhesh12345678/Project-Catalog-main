// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class UIViewController extends StatefulWidget {
//   UIViewControllerState _controllerState;
//   UINavigationController navController;
//   AppBar navBar;

//   @override
//   UIViewControllerState createState() {
//     _controllerState ??= UIViewControllerState();
//     return _controllerState;
//   }
// }

// class UIViewControllerState extends State<UIViewController> {
//   @override
//   Widget build(BuildContext context) {
//     if (this.widget.navController != null) {
//       this.widget.navBar = AppBar(
//         title: Text("Screen Title 123"),
//         backgroundColor: Colors.blue,
//       );
//     }

//     print("this.widge = ${this.widget}");

//     return Scaffold(
//         appBar: this.widget.navBar, body: buildOwnedWidget(context));
//   }

//   // ignore: missing_return
//   Widget buildOwnedWidget(BuildContext context) {
//     return Center(child: Text('Base Class'));
//   }
// }

// // ignore: must_be_immutable
// class UINavigationController extends UIViewController {
//   UINavigationControllerState _navState;
//   List<UIViewController> viewControllers = List<UIViewController>();

//   UINavigationController(UIViewController rootController) {
//     viewControllers.add(rootController);
//     rootController.navController = this;
//   }

//   @override
//   UINavigationControllerState createState() {
//     _navState ??= UINavigationControllerState();
//     return _navState;
//   }
// }

// class UINavigationControllerState extends UIViewControllerState {
//   @override
//   Widget build(BuildContext context) {
//     if (this.widget is UINavigationController) {
//       var nav = this.widget as UINavigationController;
//       return nav.viewControllers.last;
//     }

//     return this.widget;
//   }
// }

// // ignore: must_be_immutable
// class FirstVC extends UIViewController {
//   @override
//   UIViewControllerState createState() {
//     return FirstVCState();
//   }
// }

// class FirstVCState extends UIViewControllerState {
//   // @override
//   // Widget build(BuildContext context) {
//   //   return super.build(context);
//   // }

//   @override
//   Widget buildOwnedWidget(BuildContext context) {
//     return Center(child: Text('Calling...'));
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: UINavigationController(FirstVC()),
//     debugShowCheckedModeBanner: false,
//   ));
// }
