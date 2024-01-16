import 'package:flutter/material.dart';

Widget text(
        {required String giveText,
        double fontsize = 14,
        FontWeight fontweight = FontWeight.normal,
        Color textColor = Colors.black,
        double? textHeight,
        TextDecoration? underline,
        int? maxLine,
        double? letterSpacing,
        TextAlign textAlignment = TextAlign.start}) =>
    Text(
      giveText,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlignment,
      style: textStyle(
        letterSpacing: letterSpacing,
        underline: underline,
        fontfamily: "Kanit",
        fontsize: fontsize,
        fontweight: fontweight,
        textColor: textColor,
        textHeight: textHeight,
      ),
    );

TextStyle textStyle(
    {FontWeight? fontweight,
    Color? textColor,
    double? textHeight,
    String fontfamily = "Kanit",
    double? fontsize,
    double? letterSpacing,
    TextDecoration? underline}) {
  return TextStyle(
    letterSpacing: letterSpacing,
    decoration: underline,
    fontFamily: fontfamily,
    color: textColor,
    fontSize: fontsize,
    fontWeight: fontweight,
    height: textHeight,
  );
}

class AppConstants {
  static double halfTextFormFied = 150;
  static const String fontFamily = "Kanit";
}
