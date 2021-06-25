import 'package:Project_Catalog/NetworkUtil/APIHandler.dart';
import 'package:Project_Catalog/utils/Constants.dart';
import 'package:Project_Catalog/utils/Colors.dart';
import 'package:Project_Catalog/utils/Extensions.dart';
import 'package:Project_Catalog/utils/DashboardWidget.dart';
import 'package:Project_Catalog/utils/GradientPainter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'HomeView.dart';
import 'SearchView.dart';
import 'AboutView.dart';
import 'dart:ui';

// ignore: must_be_immutable
class DashboardView extends StatefulWidget {
  final Welcome loginData;

  DashboardView({this.loginData});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  var selectedIndex = 0;

  var pages = <Widget>[];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;

    pages.add(HomeView(loginData: this.widget.loginData));
    pages.add(SearchView());
    pages.add(AboutView());
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
      } else if (selectedIndex == 1) {
      } else if (selectedIndex == 2) {}
    });
  }

  Widget homeElement(var index, var icon, var title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onItemTapped(index);
        });
      },
      child: Container(
        height: 55,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
              color: selectedIndex == index ? primaryColor : TabIcon_Color,
            ),
            text(
              title,
              textColor: selectedIndex == index ? primaryColor : TabIcon_Color,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusBarColor(Colors.transparent);
    return CustomPaint(
      painter: GradientPainter(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: pages[selectedIndex],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: White_BG,
            border: Border.all(
              color: TabIcon_ShadowColor,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: TabIcon_ShadowColor,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 3.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                homeElement(0, Home_Icon, Home_Tab_Title),
                homeElement(1, Search_Icon, Search_Tab_Title),
                homeElement(2, About_Icon, About_Tab_Title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
