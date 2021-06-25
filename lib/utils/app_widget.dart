import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Colors.dart';
import 'Constants.dart' as k;
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class EditText extends StatefulWidget {
  var isPassword;
  var hintText;
  var isSecure;
  int fontSize;
  var textColor;
  var fontFamily;
  var text;
  var visible;
  var keyboardType;
  var errorText;

  var maxLine;
  TextEditingController mController;
  // VoidCallback onPressed;
  ValueChanged onChanged;

  EditText(
      {var this.fontSize = k.standardFontSize,
      var this.textColor = Colors.black,
      var this.hintText = '',
      var this.isPassword = true,
      var this.isSecure = false,
      var this.text = "",
      var this.mController,
      var this.maxLine = 1,
      var this.visible = false,
      var this.onChanged,
      var this.keyboardType,
      var this.errorText});

  @override
  State<StatefulWidget> createState() {
    return EditTextState();
  }
}

class EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isSecure) {
      return TextField(
        //  controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: primaryColor,
        onChanged: widget.onChanged,
        maxLines: widget.maxLine,
        keyboardType: widget.keyboardType,
        readOnly: widget.visible,
        style: TextStyle(
            fontSize: widget.fontSize.toDouble(),
            color: TextPrimaryColor,
            fontFamily: k.AppFont),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 8, 8, 15),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: TextPrimaryColor),
          fillColor: White_BG,
          errorText: widget.errorText,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: White_BG, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: White_BG, width: 0.0),
          ),
        ),
      );
    } else {
      return TextField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: primaryColor,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        style: TextStyle(
            fontSize: widget.fontSize.toDouble(),
            color: TextPrimaryColor,
            fontFamily: k.AppFont),
        decoration: InputDecoration(
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            child: new Icon(
              widget.isPassword ? Icons.visibility : Icons.visibility_off,
              color: Black_Color,
            ),
          ),
          errorText: widget.errorText,
          contentPadding: EdgeInsets.fromLTRB(15, 8, 8, 15),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: TextPrimaryColor),
          filled: true,
          fillColor: whiteColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: TextPrimaryColor, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: TextPrimaryColor, width: 0.0),
          ),
        ),
      );
    }
  }
}

// ignore: must_be_immutable
class CustomTheme extends StatelessWidget {
  Widget child;

  CustomTheme({this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: child,
    );
  }
}

// ignore: must_be_immutable
class ShadowButton extends StatefulWidget {
  var value;
  var isEnabled;
  VoidCallback onPressed;

  ShadowButton(
      {@required this.value, this.isEnabled, @required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return ShadowButtonState();
  }
}

class ShadowButtonState extends State<ShadowButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.fromLTRB(
          spacingStandardNew.toDouble(), 16, spacingStandardNew.toDouble(), 16),
      onPressed: widget.isEnabled ? widget.onPressed : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        widget.value,
        style: boldTextStyle(color: Colors.white, fontFamily: k.AppFont),
      )),
      color: widget.isEnabled ? primaryColor : disablesButtonColor,
    );
  }
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor = Colors.white,
    var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      boxShadow: showShadow
          ? [
              BoxShadow(
                  color: ScreenBackgroundColor, blurRadius: 10, spreadRadius: 2)
            ]
          : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

// App Bar
Widget appBar(BuildContext context,
    {List<Widget> actions,
    bool showBack = true,
    bool showTitle = false,
    String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: showBack ? backIcons(context) : null,
    title: showTitle
        ? Html(
            data: title,
            defaultTextStyle: boldTextStyle(
                color: TextPrimaryColor, size: k.fontSizeLarge.toInt()),
          )
        : null,
    actions: actions,
  );
}

Widget backIcons(context) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: TextPrimaryColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: TextPrimaryColor,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Image.asset(
        k.Back_Logo,
        width: k.mobileBackIconSize,
        height: k.mobileBackIconSize,
        color: White_BG,
      ),
    ),
    onTap: () {
      Navigator.of(context).pop();
    },
  );
}
