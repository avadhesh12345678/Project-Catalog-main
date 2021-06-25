import 'package:flutter/cupertino.dart';
import 'Colors.dart';
import 'Constants.dart';

Widget text(String text,
    {var fontSize = standardFontSizeDash,
    textColor = IconTextColorPrimary,
    var fontFamily = AppFont,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.25,
    var textAllCaps = false,
    var isLongText = false,
    var fontWeight = FontWeight.normal}) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    style: TextStyle(
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: textColor,
        height: 1.5,
        letterSpacing: latterSpacing),
  );
}
