import 'package:Project_Catalog/Views/SignInView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:Project_Catalog/utils/Colors.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Scaffold(
              body: SplashScreenView(
                home: SignInView(),
                duration: 4000,
                imageSize: 100,
                imageSrc: "logo_demo.png",
                text: "Mobile Programming",
                textType: TextType.ColorizeAnimationText,
                textStyle:
                    TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                colors: [
                  Color(0xffb92b27),
                  Color(0xff1565C0),
                  Color(0xff12c2e9),
                  Color(0xffc471ed),
                  Color(0xfff64f59),
                  Color(0xff000046),
                ],
                backgroundColor: ScreenBackgroundColor,
              ),
            ));
  }
}
