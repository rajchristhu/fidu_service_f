import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryColor = HexColor("#e76f51");
Color primaryColors = HexColor("#e76f51");
Color accentColor = HexColor("#f85032");
Color textColor = HexColor("#D1E8E4");
Color secondryColor =HexColor("#0074AD");
Color grayColor = HexColor("#E2E2E2");
Color darkGrayColor = HexColor("#717171");
Color blue = HexColor("#2a9d8f");
Color dark_blue = HexColor("#264653");
Color light_orange = HexColor("#f4a261");
Color yellow = HexColor("#e9c46a");
Color blackColor = HexColor("#383838");
Color whiteColor = HexColor("#FFFAFA");




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