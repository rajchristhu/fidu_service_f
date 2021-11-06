import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryColor = HexColor("#f85032");
Color accentColor = HexColor("#f85032");
Color textColor = HexColor("#D1E8E4");
Color secondryColor =HexColor("#0074AD");
Color grayColor = HexColor("#E2E2E2");
Color darkGrayColor = HexColor("#717171");
Color blackColor = HexColor("#383838");
Color whiteColor = HexColor("#FAFAFA");




extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}