// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class UINavigationController extends StatefulWidget {
//   List<UIViewController> viewControllers = List<UIViewController>();

//   _UINavigationControllerState stateVC;

//   @override
//   _UINavigationControllerState createState() {
//     if (stateVC == null) {
//       stateVC = _UINavigationControllerState();
//     }
//     return stateVC;
//   }

//   UINavigationController.init({@required UIViewController rootController}) {
//     viewControllers.add(rootController);
//     rootController.navVC = this;
//   }

//   push(UIViewController controller) {
//     var lastVC = viewControllers.last;

//     viewControllers.add(controller);
//     controller.navVC = this;
//     Navigator.push(lastVC.lastContext,
//         MaterialPageRoute(builder: (BuildContext context) => controller));
//   }

//   pop() {
//     viewControllers.removeLast();
//   }
// }

// class _UINavigationControllerState extends State<UINavigationController>
//     with SingleTickerProviderStateMixin {
//   refereshState() {
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   controllers() => this.widget.viewControllers.length;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: this.widget.viewControllers.last,
//     );
//   }
// }

// // ignore: must_be_immutable
// class UIViewController extends StatefulWidget {
//   UINavigationController _navVC;
//   AppBar navigationBar;
//   BuildContext lastContext;

//   UINavigationController get navVC {
//     return _navVC;
//   }

//   set navVC(UINavigationController nav) {
//     this._navVC = nav;
//     viewDidLoad();
//   }

//   viewDidLoad() {
//     if (this._navVC != null) {
//       this.navigationBar = AppBar(
//         title: Text(
//           "Screen ${this.navVC.viewControllers.length}",
//           style: TextStyle(color: Colors.red),
//         ),
//         backgroundColor: Colors.green,
//       );
//     }
//   }

//   @override
//   State createState() {
//     viewDidLoad();
//     return _UIViewControllerState();
//   }

//   Widget createContainer(BuildContext ctx, Widget body) {
//     this.lastContext = ctx;
//     return Scaffold(
//       appBar: this.navigationBar,
//       body: body,
//     );
//   }
// }

// class _UIViewControllerState extends State<UIViewController> {
//   static int counter = 0;

//   @override
//   void initState() {
//     super.initState();
//     counter++;
//   }

//   @override
//   void dispose() {
//     if (this.widget.navVC != null) {
//       this.widget.navVC.viewControllers.removeLast();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     this.widget.lastContext = context;
//     return this.widget.createContainer(
//         context,
//         Center(
//           child: FlatButton(
//             onPressed: () {
//               this.widget.navVC.push(UIViewController());
//             },
//             child: new Text(
//                 "Eureka Eureka === ${this.widget.navVC.viewControllers.length}"),
//           ),
//         ));

//     // Scaffold(
//     //   appBar: this.widget.navigationBar,
//     //   body: Center(
//     //     child: FlatButton(
//     //       onPressed: () {
//     //         this.widget.navVC.push(FlutterVC());
//     //       },
//     //       child: new Text("Tap Here === $counter"),
//     //     ),
//     //   ),
//     // );
//   }
// }

// // ignore: must_be_immutable
// class SecondVC extends UIViewController {
//   @override
//   _SecondVCState createState() => _SecondVCState();
// }

// class _SecondVCState extends State<SecondVC>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return this.widget.createContainer(
//         context,
//         Center(
//           child: FlatButton(
//             onPressed: () {
//               this.widget.navVC.push(UIViewController());
//             },
//             child: new Text("Tap Here"),
//           ),
//         ));
//   }
// }

// void main() async {
//   runApp(MaterialApp(home: SecondVC()));
// }
